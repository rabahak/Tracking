// Include files

// from Gaudi
#include "GaudiKernel/ToolFactory.h"

// local
#include "PrGeometryTool.h"

//-----------------------------------------------------------------------------
// Implementation file for class : PrGeometryTool
//
// 2012-03-22 : Olivier Callot
//-----------------------------------------------------------------------------

// Declaration of the Tool Factory
DECLARE_TOOL_FACTORY( PrGeometryTool )


//=============================================================================
// Standard constructor, initializes variables
//=============================================================================
PrGeometryTool::PrGeometryTool( const std::string& type,
                                const std::string& name,
                                const IInterface* parent )
  : GaudiTool ( type, name , parent )
{
  declareInterface<PrGeometryTool>(this);
  declareProperty( "zReference"      , m_zReference    = 8520. * Gaudi::Units::mm );
  declareProperty( "zMagnetParams"   , m_zMagnetParams    );
  declareProperty( "xParams"         , m_xParams          );
  declareProperty( "byParams"        , m_byParams         );
  declareProperty( "cyParams"        , m_cyParams         );
  declareProperty( "momentumParams"  , m_momentumParams   );
  declareProperty( "covarianceValues", m_covarianceValues );
}
//=============================================================================
// Destructor
//=============================================================================
PrGeometryTool::~PrGeometryTool() {}


//=========================================================================
//  Initialization
//=========================================================================
StatusCode PrGeometryTool::initialize ( ) {
  StatusCode sc = GaudiTool::initialize();
  if ( !sc ) return sc;

  m_magFieldSvc = svc<ILHCbMagnetSvc>( "MagneticFieldSvc", true );

  if ( m_zMagnetParams.size() == 0 ) {
    m_zMagnetParams.push_back(  5212.38  );
    m_zMagnetParams.push_back(   406.609 );
    m_zMagnetParams.push_back( -1102.35  );
    m_zMagnetParams.push_back(  -498.039 );
  }
  if ( m_xParams.size() == 0 ) {
    m_xParams.push_back(  18.6195  );
    m_xParams.push_back(  -5.55793 );
  }
  if ( m_byParams.size() == 0. ) m_byParams.push_back( -0.667996    );
  if ( m_cyParams.size() == 0. ) m_cyParams.push_back( -3.68424e-05 );
  if ( m_momentumParams.size() == 0 ) {
    m_momentumParams.push_back(   1.21014  );
    m_momentumParams.push_back(   0.637339 );
    m_momentumParams.push_back(  -0.200292 );
    m_momentumParams.push_back(   0.632298 );
    m_momentumParams.push_back(   3.23793  );
    m_momentumParams.push_back( -27.0259   );
  }
  if ( m_covarianceValues.size() == 0 ) {
    m_covarianceValues.push_back( 4.0   ); // ErrX = 2mm 
    m_covarianceValues.push_back( 400.0 ); // ErrY = 20 mm
    m_covarianceValues.push_back( 4.e-6 ); // ErrSlX = 2 mrad
    m_covarianceValues.push_back( 1.e-4 ); // ErrSlY = 10 mrad
    m_covarianceValues.push_back( 0.1   ); // errQQoverP = 10% of qOverP
  }
  return StatusCode::SUCCESS;
}

//=========================================================================
//  Returns the best momentum estimate for a seed: assumes it comes from (0,0,0)
//  and use the same parameterisation.
//=========================================================================
float PrGeometryTool::qOverP ( const PrHybridSeedTrack& track) {
  float qop(1.0/Gaudi::Units::GeV) ;
  float magscalefactor = m_magFieldSvc->signedRelativeCurrent() ;
  if( std::abs(magscalefactor) > 1e-6 ){
    float bx   = track.xSlope( 0. );
    float bx2  = bx * bx;
    //== Compute the slopes before the magnet: Assume the track comes from (0,0,0) and
    //== crosses the T station part at zMagnet
    float zMagnet = ( m_zMagnetParams[0] );
    float xMagnet = track.x( zMagnet );
    float yMagnet = track.y( zMagnet );
    float slXFront = xMagnet / zMagnet;
    float slYFront = yMagnet / zMagnet;
    float slX2 = slXFront * slXFront;
    float slY2 = slYFront * slYFront;
    float dSlope = slXFront - bx;
    //== Iterate as ZMagnet depends on the slope before...
    zMagnet = ( m_zMagnetParams[0] +
                m_zMagnetParams[1] * dSlope * dSlope +
                m_zMagnetParams[2] * slX2 +
                m_zMagnetParams[3] * slY2 );
    xMagnet = track.x( zMagnet );
    yMagnet = track.y( zMagnet );
    slXFront = xMagnet / zMagnet;
    slYFront = yMagnet / zMagnet;
    slX2 = slXFront * slXFront;
    slY2 = slYFront * slYFront;
    float coef = ( m_momentumParams[0] +
                   m_momentumParams[1] * bx2 +
                   m_momentumParams[2] * bx2 * bx2 +
                   m_momentumParams[3] * bx * slXFront +
                   m_momentumParams[4] * slY2 +
                   m_momentumParams[5] * slX2 * slY2 );
    float proj = sqrt( ( 1. + slX2 + slY2 ) / ( 1. + slX2 ) );
    qop = dSlope / ( coef * Gaudi::Units::GeV * proj * magscalefactor ) ;
  }
  return qop ;
}


//=========================================================================
//  Returns the best momentum estimate
//=========================================================================
float PrGeometryTool::qOverP( const LHCb::Track* vTr,  const LHCb::Track* sTr){
  
  float zMagnet = ( m_zMagnetParams[0] );

  float qop(1.0/Gaudi::Units::GeV) ;
  float magscalefactor = m_magFieldSvc->signedRelativeCurrent() ;
  if( std::abs(magscalefactor) > 1e-6 ) {

    const LHCb::State& vState = vTr->closestState(0.);
    const LHCb::State& sState = sTr->closestState(zMagnet);

    float txT   = sState.tx();
    float txV   = vState.tx();
    float tyV   = vState.ty();
    float txV2  = txV * txV;
    float tyV2  = tyV * tyV;
    float dSlope = txV - txT;

    //== Iterate as ZMagnet depends on the slope before...
    zMagnet = ( m_zMagnetParams[0] +
                m_zMagnetParams[1] * dSlope * dSlope +
                m_zMagnetParams[2] * txV2 +
                m_zMagnetParams[3] * tyV2 );
    

    const LHCb::State& sState2 = sTr->closestState(zMagnet);
    txT   = sState2.tx();
    float txT2  = txT * txT;

    float coef = ( m_momentumParams[0] +
                   m_momentumParams[1] * txT2 +
                   m_momentumParams[2] * txT2 *txT2 +
                   m_momentumParams[3] * txT * txV +
                   m_momentumParams[4] * tyV2 +
                   m_momentumParams[5] * tyV2 * tyV2 );
    float proj = sqrt( ( 1. + txV2 + tyV2 ) / ( 1. + txV2 ) );
    qop = ( txV - txT ) / ( coef * Gaudi::Units::GeV * proj * magscalefactor ) ;
  }
  return qop ;
}

//=========================================================================
//  Default covariance matrix: Large errors as input to Kalman fitter.
//=========================================================================
Gaudi::TrackSymMatrix PrGeometryTool::covariance ( const float qOverP ) {
  Gaudi::TrackSymMatrix cov;
  cov(0,0) = m_covarianceValues[0];
  cov(1,1) = m_covarianceValues[1];
  cov(2,2) = m_covarianceValues[2];
  cov(3,3) = m_covarianceValues[3];
  cov(4,4) = m_covarianceValues[4] * qOverP * qOverP;
  return cov;
}
//=============================================================================
