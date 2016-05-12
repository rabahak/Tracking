// *********************************************************************************
// ************************ Introduction to Forward Tracking **********************
// *********************************************************************************
//
//  A detailed introduction in Forward tracking (with real pictures!) can be
//  found here:
//  (2002) http://cds.cern.ch/record/684710/files/lhcb-2002-008.pdf
//  (2007) http://cds.cern.ch/record/1033584/files/lhcb-2007-015.pdf
//  (2014) http://cds.cern.ch/record/1641927/files/LHCb-PUB-2014-001.pdf
//
// *** Short Introduction in geometry:
//
// The SciFi Tracker Detector, or simple Fibre Tracker (FT) consits out of 3 stations.
// Each station consists out of 4 planes/layers. Thus there are in total 12 layers,
// in which a particle can leave a hit. The reasonable maximum number of hits a track
// can have is thus also 12 (sometimes 2 hits per layer are picked up).
//
// Each layer consists out of several Fibre mats. A fibre has a diameter of below a mm.(FIXME)
// Several fibres are glued alongside each other to form a mat.
// A Scintilating Fibre produces light, if a particle traverses. This light is then
// detected on the outside of the Fibre mat.
//
// Looking from the collision point, one (X-)layer looks like the following:
//
//                    y       6m
//                    ^  ||||||||||||| Upper side
//                    |  ||||||||||||| 2.5m
//                    |  |||||||||||||
//                   -|--||||||o||||||----> -x
//                       |||||||||||||  
//                       ||||||||||||| Lower side
//                       ||||||||||||| 2.5m
//
// All fibres are aranged parallel to the y-axis. There are three different 
// kinds of layers, denoted by X,U,V. The U/V layers are rotated with respect to
// the X-layers by +/- 5 degrees, to also get a handle of the y position of the 
// particle. As due to the magnetic field particles are only deflected in 
// x-direction, this configuration offers the best resolution.
// The layer structure in the FT is XUVX-XUVX-XUVX.
//
// The detector is divided into an upeer and a lower side (>/< y=0). As particles
// are only deflected in x direction there are only very(!) few particles that go
// from the lower to the upper side, or vice versa. The reconstruction algorithm
// can therefore be split into two independent steps: First track reconstruction
// for tracks in the upper side, and afterwards for tracks in the lower side.
//
// Due to construction issues this is NOT true for U/V layers. In these layers the
// complete(!) fibre modules are rotated, producing a zic-zac pattern at y=0, also
// called  "the triangles". Therefore for U/V layers it must be explicetly also 
// searched for these hit on the "other side", if the track is close to y=0.
// Sketch (rotation exagerated!):
//                                          _.*
//     y ^   _.*                         _.*
//       | .*._      Upper side       _.*._           
//       |     *._                 _.*     *._        
//       |--------*._           _.*           *._----------------> x
//       |           *._     _.*                 *._     _.*
//                      *._.*       Lower side      *._.*
//
// 
//
//
// *** Short introduction in the Forward Tracking algorithm
//
// The track reconstruction is seperated into several steps:
//
// 1) Using only X-hits
//    1.1) Preselection: colelctAllXHits()
//    1.2) Hough Transformation: xAtRef_SamePlaneHits()
//    1.3) Cluster search: selectXCandidates()
//    1.4) Linear and than Cubic Fit of X-Projection
// 2) Introducing U/V hits or also called stereo hits
//    2.1) Preselection: collectStereoHits
//    2.2) Cluster search: selectStereoHits
//    2.3) Fit Y-Projection
// 3) Using all (U+V+X) hits
//    3.1) Fitting X-Projection 
//    3.2) calculating track quality with a Neural Net
//    3.3) final clone+ghost killing
//
// *****************************************************************

// Include files 

// from Gaudi
#include "Event/StateParameters.h"
// local
#include "PrForwardTool.h"

#include <algorithm> //swap,


//-----------------------------------------------------------------------------
// Implementation file for class : PrForwardTool
//
// 2012-03-20 : Olivier Callot
// 2013-03-15 : Thomas Nikodem
// 2015-02-13 : Sevda Esen [additional search in the triangles by Marian Stahl]
// 2016-03-09 : Thomas Nikodem [complete restructuring]
//-----------------------------------------------------------------------------

// Declaration of the Tool Factory
DECLARE_TOOL_FACTORY( PrForwardTool )

//=============================================================================
// Standard constructor, initializes variables
//=============================================================================
  PrForwardTool::PrForwardTool( const std::string& type,
                                const std::string& name,
                                const IInterface* parent )
    : IPrForwardTool ( type, name , parent )
{
  declareInterface<PrForwardTool>(this);
  declareProperty( "HitManagerName",         m_hitManagerName         = "PrFTHitManager"         );
  declareProperty( "AddUTHitsToolName",      m_addUTHitsToolName      = "PrAddUTHitsTool"        );

  declareProperty( "YToleranceUVsearch",     m_yTol_UVsearch          =   11.* Gaudi::Units::mm  );          
  declareProperty( "TolY",                   m_tolY                   =    5.* Gaudi::Units::mm  );
  declareProperty( "TolYSlope",              m_tolYSlope              =0.002 * Gaudi::Units::mm  );
  declareProperty( "MaxChi2LinearFit",       m_maxChi2LinearFit       =  100.                    );
  declareProperty( "MaxChi2XProjection",     m_maxChi2XProjection     =   15.                    );
  declareProperty( "MaxChi2PerDoF",          m_maxChi2PerDoF          =    7.                    );

  declareProperty( "TolYMag",                m_tolYMag                =   10.* Gaudi::Units::mm  );
  declareProperty( "TolYMagSlope",           m_tolYMagSlope           =    0.015                 );
  declareProperty( "MinYGap",                m_minYGap                =  0.4 * Gaudi::Units::mm  );

  declareProperty( "MinTotalHits",           m_minTotalHits           =   10                     );
  declareProperty( "MaxChi2StereoLinear",    m_maxChi2StereoLinear    =   60.                    );
  declareProperty( "MaxChi2Stereo",          m_maxChi2Stereo          =    4.5                   );

  //first loop Hough Cluster search
  declareProperty( "MinXHits",               m_minXHits               =    5                     );
  declareProperty( "MaxXWindow",             m_maxXWindow             =  1.2 * Gaudi::Units::mm  );
  declareProperty( "MaxXWindowSlope",        m_maxXWindowSlope        =0.002 * Gaudi::Units::mm  );
  declareProperty( "MaxXGap",                m_maxXGap                =  1.2 * Gaudi::Units::mm  );
  declareProperty( "MInSingleHits",          m_minSingleHits          =    2                     );
  //second loop Hough Cluster search
  declareProperty( "SecondLoop",             m_secondLoop             =  true                    );
  declareProperty( "MinXHits2nd",            m_minXHits_2nd           =    4                     );
  declareProperty( "MaxXWindow2nd",          m_maxXWindow_2nd         =  1.5 * Gaudi::Units::mm  );
  declareProperty( "MaxXWindowSlope2nd",     m_maxXWindowSlope_2nd    =0.002 * Gaudi::Units::mm  );
  declareProperty( "MaxXGap2nd",             m_maxXGap_2nd            =  0.5 * Gaudi::Units::mm  );

  //preselection (if done here??!!) 
  declareProperty( "Preselection",           m_Preselection           = false                    );
  declareProperty( "PreselectionPT",         m_PreselectionPT         = 400.* Gaudi::Units::MeV  );

  //collectX search
  declareProperty( "MinPt",                  m_minPt                  =   50 * Gaudi::Units::MeV );
    //stereo hit matching
  declareProperty( "TolYCollectX",           m_tolY_collectX          =    4.1* Gaudi::Units::mm  );
  declareProperty( "TolYSlopeCollectX",      m_tolYSlope_collectX     =0.0018 * Gaudi::Units::mm  );
  declareProperty( "TolYTriangleSearch",     m_tolYTriangleSearch     =    20.f                  );
    //veloUT momentum estimate
  declareProperty( "UseMomentumEstimate",    m_useMomentumEstimate    = true                     ); 
  declareProperty( "UseWrongSignWindow",     m_useWrongSignWindow     = true                     );
  declareProperty( "WrongSignPT",            m_wrongSignPT            = 2000.* Gaudi::Units::MeV );

  //Track Quality (Neural Net) 
  declareProperty( "MaxQuality",             m_maxQuality             =   0.9                    );
  declareProperty( "DeltaQuality",           m_deltaQuality           =   0.1                    );

 
}
//=============================================================================
// Destructor
//=============================================================================
PrForwardTool::~PrForwardTool() {}


//=========================================================================
//  initialize
//=========================================================================
StatusCode PrForwardTool::initialize ( ) {
  StatusCode sc = GaudiTool::initialize();
  if ( !sc ) return sc;

  m_geoTool = tool<PrGeometryTool>("PrGeometryTool");
  m_hitManager = tool<PrHitManager>( m_hitManagerName );

  const int numberallXHitsAfterCuts = 2500;
  m_allXHits1.reserve(numberallXHitsAfterCuts); //TODO check best size!
  m_allXHits2.reserve(numberallXHitsAfterCuts);

  if ( "" != m_addUTHitsToolName  ) {
    m_addUTHitsTool = tool<IPrAddUTHitsTool>( m_addUTHitsToolName, this );
  } else {
    m_addUTHitsTool = NULL;
  }

  //original PrGeometry Params
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
  m_zReference    = 8520.f;

  //layer structure of the FT det
  m_xZones         = {{ 0 , 6 , 8 , 14 , 16 , 22 }}; //side 0, side 1: +1
  m_uvZones        = {{ 2 , 4 , 10, 12 , 18 , 20 }}; //side 0, side 1: +1
  m_triangleZones  = {{ 3 , 5 , 11, 13 , 19 , 21 }}; //side 0, side 1: -1

  //allocate tmp mem for merge of sorted lists
  m_sizeMergeTmp1=1./3.*numberallXHitsAfterCuts;
  m_sizeMergeTmp2=2./3.*numberallXHitsAfterCuts;
  m_MergeTmp1   = (PrHit**) malloc(sizeof(PrHit*) *m_sizeMergeTmp1 );
  m_MergeTmp2   = (PrHit**) malloc(sizeof(PrHit*) *m_sizeMergeTmp1 );
  m_MergeTmp1_1 = (PrHit**) malloc(sizeof(PrHit*) *m_sizeMergeTmp2 );

  //vector for xAtRef
  for(int i=0;i<8;i++)
   m_xHits[i] = 0.f;

  for(int i=0;i<12;i++){
    auto tmp = std::unique_ptr< PrHits >(new PrHits() );
    m_otherHits[i] = std::move(tmp);
  }

  //Input variable names for TMVA NeuralNet
  std::vector<std::string> inputVars;
  inputVars.push_back("nPlanes");
  inputVars.push_back("abs(dSlope)");
  inputVars.push_back("dp");
  inputVars.push_back("slope2");
  inputVars.push_back("dby");
  inputVars.push_back("dbx");
  inputVars.push_back("day");
  m_MLPReader =  new ReadMLP(inputVars);

  //Input vector for TMVA NeuralNet
  m_MLPReader_input.push_back(0.f);
  m_MLPReader_input.push_back(0.f);
  m_MLPReader_input.push_back(0.f);
  m_MLPReader_input.push_back(0.f);
  m_MLPReader_input.push_back(0.f);
  m_MLPReader_input.push_back(0.f);
  m_MLPReader_input.push_back(0.f);

  //check options
  if(m_maxChi2StereoLinear <= m_maxChi2Stereo){
    error() << "Error: m_maxChi2StereoLinear must be chosen larger than m_maxChi2Stereo" << endmsg;
    return StatusCode::FAILURE;
  }

  return StatusCode::SUCCESS;
}

StatusCode PrForwardTool::finalize ( ) {

  if( UNLIKELY( msgLevel(MSG::DEBUG) ) ) debug() << "==> Finalize" << endmsg;

  if(m_MergeTmp1 != nullptr){
    free(m_MergeTmp1);
    m_MergeTmp1 = nullptr;
  }
  if(m_MergeTmp2 != nullptr){
    free(m_MergeTmp2);
    m_MergeTmp2 = nullptr;
  }
  if(m_MergeTmp1_1 != nullptr){
    free(m_MergeTmp1_1);
    m_MergeTmp1_1 = nullptr;
  }
  
  if(m_MLPReader != nullptr){
    delete m_MLPReader;
    m_MLPReader = nullptr;
  }

  return GaudiTool::finalize();

}
//=========================================================================
//  Main method: Process a track
//=========================================================================
void PrForwardTool::extendTrack ( LHCb::Track* velo, LHCb::Tracks* result ) {

  // -- > Debug --------
  m_debug = (velo->key() == m_veloKey) || msgLevel( MSG::DEBUG );
  // -- < Debug --------

  const LHCb::State& state = velo->closestState( StateParameters::ZEndVelo );
  m_x0     = state.x();
  m_y0     = state.y();
  m_z0     = state.z();
  m_tx     = state.tx();
  m_ty     = state.ty();
  m_qOverP = state.qOverP();
  m_tx2    = m_tx * m_tx;
  m_ty2    = m_ty * m_ty;
  m_slope2 = m_tx2 + m_ty2;


  //in the worst(!) case preslection <<< HERE!
  if(std::fabs(m_qOverP)>0.001) return; //very low momentum tracks P < 1GeV of no interest
  // - Preselect the VeloUT tracks
  if(m_Preselection && velo->pt()<m_PreselectionPT) return;
  
  PrForwardTrack track( velo, m_zReference, m_y0 + (m_zReference - m_z0)*m_ty, m_ty);

  //calculate z of velo at zref to decide on which side to search
  float yAtRef = yFromVelo( m_zReference );

  //First loop Hough Cluster search 
  m_minXHits_cur        = m_minXHits;
  m_maxXWindow_cur      = m_maxXWindow;
  m_maxXWindowSlope_cur = m_maxXWindowSlope ;
  m_maxXGap_cur         = m_maxXGap;

  //Hough Trafo
  m_allXHits1.clear(); //Top
  m_allXHits2.clear(); //Bottom
  if(yAtRef>-5.f)collectAllXHits(m_allXHits1, track, 0); //Top
  if(yAtRef< 5.f)collectAllXHits(m_allXHits2, track, 1); //Bottom

  m_trackCandidates.clear();
  if(yAtRef>-5.f)selectXCandidates(m_trackCandidates, m_allXHits1, track, 0);
  if(yAtRef< 5.f)selectXCandidates(m_trackCandidates, m_allXHits2, track, 1);

  // -- > Debug --------
  if ( UNLIKELY(m_debug)) {
    info() << endmsg
           << "=============== Selected " << m_trackCandidates.size() << " candidates in 1st loop."
           << endmsg
           << endmsg;
    int nValidTracks = 0;
    for ( PrForwardTracks::const_iterator itT = m_trackCandidates.begin();
          m_trackCandidates.end() != itT; ++itT ) {
      if ( (*itT).valid() ) printTrack( *itT );
      nValidTracks++;
    }
    info () << "  valid tracks :   " << nValidTracks << endmsg;
  }
  // -- < Debug --------

  //Stereo hit search and full Fit
  selectFullCandidates( m_trackCandidates);

  // -- > Debug --------
  if ( UNLIKELY(m_debug) ) {
    info() << "********** final list of 1st loop candidates, Velo = " << velo->key() << " ********" << endmsg;
    for ( PrForwardTracks::iterator itT = m_trackCandidates.begin();
          m_trackCandidates.end() != itT; ++itT ) {
      if ( (*itT).valid() ) printTrack( *itT );
    }
  }
  // -- < Debug --------


  //check tracks, if no OK track is found start second Loop search
  bool ok = false;
  for(auto& track : m_trackCandidates){
    if(!track.valid()) continue;
    if(track.hits().size() >10){
      ok=true;
      break;
    }
  }

  if(!ok && m_secondLoop){
    //Second loop Hough Cluster search
    m_minXHits_cur        = m_minXHits_2nd;
    m_maxXWindow_cur      = m_maxXWindow_2nd;
    m_maxXWindowSlope_cur = m_maxXWindowSlope_2nd ;
    m_maxXGap_cur         = m_maxXGap_2nd;
    m_trackCandidates2ndLoop.clear();
    if(yAtRef>-5.f)selectXCandidates(m_trackCandidates2ndLoop, m_allXHits1, track, 0);
    if(yAtRef< 5.f)selectXCandidates(m_trackCandidates2ndLoop, m_allXHits2, track, 1);
    selectFullCandidates( m_trackCandidates2ndLoop);
    m_trackCandidates.insert(std::end(m_trackCandidates),std::begin(m_trackCandidates2ndLoop),std::end(m_trackCandidates2ndLoop));
    for(auto& track : m_trackCandidates){
      ok = ok || track.valid();
    }
  }

  //clone+ghost killing after merging
  if(ok || !m_secondLoop){ 
    std::sort( m_trackCandidates.begin(), m_trackCandidates.end(), PrForwardTrack::LowerByQuality() );
    float minQuality = m_maxQuality;
    for ( PrForwardTracks::iterator itT = std::begin(m_trackCandidates); std::end(m_trackCandidates) != itT; ++itT ) {
      if(!(*itT).valid()) continue;
      if((*itT).quality() + m_deltaQuality < minQuality) minQuality = (*itT).quality() + m_deltaQuality;
      if((*itT).quality() > minQuality) (*itT).setValid(false);
    }
    makeLHCbTracks( m_trackCandidates, result );
  }
 
}


//=========================================================================
//  Create Full candidates out of xCandidates
//  Searching for stereo hits
//  Fit of all hits
//  save everything in track candidate folder
//=========================================================================
void PrForwardTool::selectFullCandidates(PrForwardTracks& trackCandidates){

  int nbOK = 0;
  for ( PrForwardTracks::iterator itT = trackCandidates.begin();
        trackCandidates.end() != itT; ++itT ) {
    if ( !(*itT).valid() ) continue;
    (*itT).setValid( false ); //set only true after track passed everything

    //at least 4 stereo hits OR  minTotalHits - found xHits (WATCH unsigned numbers!)
    m_minStereoHits = 4u;
    if((*itT).hits().size()+m_minStereoHits < m_minTotalHits) m_minStereoHits = m_minTotalHits - (*itT).hits().size();

    // search for hits in U/V layers
    if(!collectStereoHits( *itT ))continue;
    
    // select best U/V hits
    if ( !selectStereoHits( *itT ) ) continue;

    //reset m_pc to count ALL hits
    m_pc.clear();
    m_pc.set( (*itT).hits() );

    //make a fit of ALL hits
    if(!fitXProjection ( *itT ))continue;

    //check in empty x layers for hits
    int side = ((*itT).y(m_zReference) < 0.f) ? 1 : 0;
    if(!addHitsOnEmptyXLayers( *itT,side,true))continue;

    //track has enough hits, calcualte quality and save if good enough
    if( m_pc.nbDifferent() >= m_minTotalHits ){

      float qOverP  = calcqOverP(*itT);

      float bx = 0.f;
      float ay = 0.f;
      float by = 0.f;
      //orig params before fitting , TODO faster if only calc once?? mem usage?
      {      
        const float xAtRef = (*itT).x(m_zReference );
        float dSlope  = ( xFromVelo(m_zReference) - xAtRef ) / ( m_zReference - m_zMagnetParams[0]);
        const float zMagSlope = m_zMagnetParams[2] * m_tx2 +  m_zMagnetParams[3] * m_ty2;
        const float zMag    = m_zMagnetParams[0] + m_zMagnetParams[1] *  dSlope * dSlope  + zMagSlope;
        const float xMag    = xFromVelo( zMag );
        const float slopeT  = ( xAtRef - xMag ) / ( m_zReference - zMag );
        dSlope        = slopeT - m_tx;
        const float dyCoef  = dSlope * dSlope * m_ty;

        bx = slopeT;
        ay = yFromVelo( m_zReference );
        by = m_ty + dyCoef * m_byParams[0];
      }

      //ay,by,bx params
      float bx1 = 0.f;
      float ay1 = 0.f;
      float by1 = 0.f;
      (*itT).getParametersAyByBx( ay1, by1, bx1);

      m_MLPReader_input[0] = m_pc.nbDifferent();
      m_MLPReader_input[1] = std::fabs(qOverP);
      m_MLPReader_input[2] = m_qOverP - qOverP; //veloUT - scifi
      m_MLPReader_input[3] = m_slope2;
      m_MLPReader_input[4] = by - by1;
      m_MLPReader_input[5] = bx - bx1;
      m_MLPReader_input[6] = ay - ay1;
      float quality = m_MLPReader->GetMvaValue(m_MLPReader_input);
      quality = 1.f-quality; //backward compability

      if(quality < m_maxQuality){
        (*itT).setValid( true );
        (*itT).setQuality( quality );
        (*itT).setQoP( qOverP );
        // -- > Debug --------
        if ( UNLIKELY(m_debug )) {
          info() << "*** Accepted as track " << nbOK << " ***" << endmsg;
          printTrack( *itT );
        }
        // -- < Debug --------
        ++nbOK;
      }
    }
  }
}

//=========================================================================
//  Collect all X hits, within a window defined by the minimum Pt.
//  Better restrictions possible, if we use the momentum of the input track.
//  Ask for the presence of a stereo hit in the same biLayer compatible.
//  This reduces the efficiency. X-alone hits to be re-added later in the processing
//=========================================================================
void PrForwardTool::collectAllXHits (PrHits& allXHits, PrForwardTrack& track, unsigned int side) {

  //TODO improve check if hits can be found at all

  //== Compute the size of the search window in the reference plane
  float dxRef = 3973000. * sqrt( m_slope2 ) / m_minPt - 2200. *  m_ty2 - 1000. * m_tx2; // tune this window
  //dxRef *= 1.10; //== 10% tolerance
  dxRef *= 0.9; //make windows a bit too small
  float zMag = zMagnet();
  m_nbXPlanes = m_xZones.size();

  std::vector<int> iZoneEnd;
  iZoneEnd.reserve(7); //6 x planes
  iZoneEnd.push_back(0);

  for ( unsigned int iZone=0;iZone<m_xZones.size();iZone++){

    //reduce if statements in controlflow
    unsigned int zoneNumber   = m_xZones[iZone] + side;
    unsigned int uvZoneNumber = m_uvZones[iZone] + side;
    unsigned int triangleZone = m_triangleZones[iZone] - side;

    PrHitZone* zone = m_hitManager->zoneFast(zoneNumber);
    float zZone = zone->z();
    float xInZone = xFromVelo( zZone );
    float yInZone = yFromVelo( zZone );
    //TODO do this check more clever at the beginning?!
    if ( !zone->isInside( xInZone, yInZone ) ) continue;
    float xTol  = dxRef * zZone / m_zReference;
    if ( zZone > m_zReference ) xTol = dxRef * (zZone - zMag) / ( m_zReference - zMag );
    float xMin  = xInZone - xTol;
    float xMax  = xInZone + xTol;

    // -- Use momentum estimate from VeloUT tracks
    if( m_useMomentumEstimate && 0.f != m_qOverP ){
          
      float pt = track.track()->pt();

      //TODO tune this window
      // -- Extra window to catch wrong sign tracks
      float xTolWS = 0;
      if(m_useWrongSignWindow && pt>m_wrongSignPT){
        float dxRefWS = 
          3973000. * sqrt( m_slope2 ) / m_wrongSignPT - 2200.f *  m_ty2 - 1000.f * m_tx2;
        //dxRefWS *= 1.10; //== 10% tolerance
        dxRefWS *= 0.9; //make windows a bit too small
	
        xTolWS  = dxRefWS * zZone / m_zReference;
        if ( zZone > m_zReference ) xTolWS = dxRefWS * (zZone - zMag) / ( m_zReference - zMag );
      }
      
      float q = (m_qOverP>0.f)?1.f:-1.f;
      //TODO once per event is enough
      const float magscalefactor = m_geoTool->magscalefactor();
      const float dir = q*magscalefactor*(-1);
      if(dir > 0){
        xMin = xInZone - xTolWS;
        xMax = xInZone + xTol;
      }else{
        xMin = xInZone - xTol;
        xMax = xInZone + xTolWS;
      }
    }
 
    // -- Use search to find the lower bound of the range of x values
    auto itH = m_hitManager->getIterator_lowerBound(zoneNumber, xMin);
    auto itEnd = m_hitManager->getIterator_End( zoneNumber );
    if(UNLIKELY(itH == itEnd)) continue; //otherwise crash in calculating xMinUV

    //MatchStereoHits
    PrHitZone* zoneUv = m_hitManager->zoneFast(uvZoneNumber);
    const float xInUv       = xFromVelo( zoneUv->z() );
    const float zRatio      = ( zoneUv->z() - zMag ) / ( zZone - zMag );
    const float dx          = yInZone * zoneUv->dxDy();//x correction from rotation by stereo angle
    const float xCentral    = xInZone + dx;
    float xPredUv = xInUv + ( (*itH).x() - xInZone) * zRatio - dx;//predicted hit in UV-layer
    float maxDx   = m_tolY_collectX + ( fabs( (*itH).x() -xCentral ) + fabs( yInZone ) ) * m_tolYSlope_collectX;
    float xMinUV = xPredUv - maxDx;
    std::vector<PrHit>::const_iterator itUV1    = m_hitManager->getIterator_lowerBound(uvZoneNumber, xMinUV);
    std::vector<PrHit>::const_iterator itUV1end = m_hitManager->getIterator_End( uvZoneNumber );


    if(std::fabs(yInZone) > m_tolYTriangleSearch){ //cuts very slightly into distribution, 100% save cut is ~50
    //no triangle search necessary!
      for ( ; itEnd != itH && (*itH).x() < xMax; ++itH ) { //loop over all xHits in a layer between xMin and xMax
        //if( (*itH).isUsedInTrack() ) continue;//hit marked by preforward!
        const float xPredUv = xInUv + ( (*itH).x() - xInZone) * zRatio - dx;//predicted hit in UV-layer
        const float maxDx   = m_tolY_collectX + ( fabs( (*itH).x() -xCentral ) + fabs( yInZone ) ) * m_tolYSlope_collectX;
        const float xMinUV  = xPredUv - maxDx;
        const float xMaxUV  = xPredUv + maxDx;
        if( matchStereoHit(itUV1, itUV1end, xMinUV, xMaxUV) ){
          (*itH).setUnUsed();
          allXHits.push_back(&*itH);
        }
      }
    }else{
    //triangle search
      std::vector<PrHit>::const_iterator itUV2    = m_hitManager->getIterator_lowerBound(triangleZone, xMinUV);
      std::vector<PrHit>::const_iterator itUV2end = m_hitManager->getIterator_End( triangleZone );
      for ( ; itEnd != itH && (*itH).x() < xMax; ++itH ) { //loop over all xHits in a layer between xMin and xMax
        //if( (*itH).isUsedInTrack() ) continue;//hit marked by preforward!
        const float xPredUv = xInUv + ( (*itH).x() - xInZone) * zRatio - dx;//predicted hit in UV-layer
        const float maxDx   = m_tolY_collectX + ( fabs( (*itH).x() -xCentral ) + fabs( yInZone ) ) * m_tolYSlope_collectX; 
        const float xMinUV  = xPredUv - maxDx;
        const float xMaxUV  = xPredUv + maxDx;
        if( matchStereoHitWithTriangle(itUV1, itUV1end, itUV2, itUV2end, yInZone, xMinUV, xMaxUV, side) ){
          (*itH).setUnUsed();
          allXHits.push_back(&*itH);
        }
      }
    }
    const int iStart = iZoneEnd.back();
    const int iEnd = allXHits.size();
    iZoneEnd.push_back(iEnd);
    if( LIKELY(!(iStart == iEnd))){
      xAtRef_SamePlaneHits(allXHits.begin()+iStart , allXHits.begin()+iEnd ); //calc xRef for all hits on same layer
    } 
  }

  if(LIKELY(iZoneEnd.size() == 7)){
    merge6Sorted( allXHits, iZoneEnd);
  }else{
    // default sort
    std::sort( allXHits.begin(), allXHits.end(), PrHit::LowerByCoord() );
  }

  // -- > Debug --------
  if ( UNLIKELY(m_debug )) {
    float xWindow = m_maxXWindow_cur + fabs( xFromVelo( m_zReference )) * m_maxXWindowSlope_cur;
    info() << "**** Processing Velo track " << track.track()->key() << " zone " << side
           << " Selected " << allXHits.size() << " hits, window size " << xWindow << endmsg;
    for ( PrHits::const_iterator itH = allXHits.begin(); allXHits.end() != itH; ++itH ) {
      if ( matchKey( *itH ) ) printHit( *itH, " " );
    }
  }
  // -- < Debug --------
  
}

//=========================================================================
//  Select the zones in the allXHits array where we can have a track
//=========================================================================
void PrForwardTool::selectXCandidates( PrForwardTracks& trackCandidates, PrHits& allXHits, PrForwardTrack& track, unsigned int side ){

  if ( allXHits.size() < m_minXHits_cur ) return;
  float xStraight = xFromVelo( m_zReference );
  PrHits::iterator it1 = allXHits.begin();
  PrHits::iterator it2;

  while( true ) {

    while( it1+1 < allXHits.end() && (*it1)->isUsed() ) ++it1;
    it2 = it1 + m_minXHits_cur;
    if(it2 > allXHits.end()) break;

    //define search window for Cluster
    //TODO better xWindow calculation?? how to tune this???
    float xWindow = m_maxXWindow_cur + ( fabs( (*it1)->coord() ) + fabs( (*it1)->coord() - xStraight ) ) * m_maxXWindowSlope_cur; 

    //Scan through vector and search for cluster
    if( (*(it2-1))->coord() - (*it1)->coord() > xWindow ) {
      ++it1;
      if ( it2-it1 < m_minXHits_cur) ++it2;
      continue;
    }

    //Cluster candidate found, now count planes
    m_pc.clear(); 
    m_pc.setUnused( it1, it2 );

    //Improve cluster
    while(true){
      if(!(it2 < allXHits.end()))break;

      //remove first if it is a 'used' hit
      if( (*it1)->isUsed() ){
        ++it1;
        continue;
      }

      //A LOT of ghosts for 0.7% long efficiency?!
      //How is timing? -> +50% :(
      ////increase size if not enough planes
      //if(m_pc.nbDifferent() < m_minXHits_cur){
      //  m_pc.addHitIfUnused( *it2 );
      //  ++it2;
      //  continue;
      //}

      //add next hit, if it is good and it  would be a single one
      if(  ((*it2)->coord() - (*it1)->coord() < xWindow )
        && (m_pc.nbInPlane( (*it2)->planeCode() ) == 0) 
      ){
        m_pc.addHitIfUnused( *it2 );
        ++it2;
        continue;
      }

      //Add next hit, if there is only a small gap between the hits
      if( ((*it2)->coord() < (*(it2-1))->coord() + m_maxXGap_cur)
      // && (m_pc.nbInPlane( (*it2)->planeCode() ) == 0) TODO can we get better?!
      ){
        m_pc.addHitIfUnused( *it2 );
        ++it2;
        continue;
      }

      break;
    }

    if ( m_pc.nbDifferent() < m_minXHits_cur ) {
      //well, if you don't want to, next one!
      ++it1;
      continue;
    }

    //====================================================================
    //  Now we have a (rather) clean candidate, do best hit selection
    //  Two possibilities:
    //  1) If there are enough planes with only one hit, do a straight
    //      line fit through these and select good matching others
    //  2) Do some magic
    //====================================================================
   
    std::unique_ptr<PrHits> coordToFit( new PrHits());;
    coordToFit->reserve(16);

    float xAtRef = 0.;
    unsigned int nbSingle = m_pc.nbSingle(); 

    if ( nbSingle >= m_minSingleHits && nbSingle != m_pc.nbDifferent() ) { 
      //1) we have enough single planes (thus two) to make a straight line fit 
      
      m_line.reset( m_zReference, coordToFit.get() );
      for(int i=0;i<12;i++)m_otherHits[i]->clear();

      // -- > Debug --------
      if ( m_debug ){
        info() << "--- " << nbSingle << " planes with a single hit. Select best chi2 in other planes ---" << endmsg;
        for (auto itH = it1; it2 > itH; ++itH ) {
          if ( (*itH)->isUsed() ) continue;
          printHit( *itH );
        }
      }
      // -- < Debug --------
      
      //seperate single and double hits
      for(auto itH = it1; it2 > itH; ++itH ){
        if( (*itH)->isUsed() ) continue;
        if( m_pc.nbInPlane( (*itH)->planeCode() ) == 1 ){
          m_line.addHit( *itH );
        }else{
          m_otherHits[(*itH)->planeCode()]->push_back( *itH );
        }
      }
      m_line.solve();

      //select best other hits (only best is enough!)
      for(int i=0;i<12;i++){  //12 layers
        if(m_otherHits[i]->empty()) continue;
        PrHits::iterator itH    = std::begin(*m_otherHits[i]);
        PrHits::iterator itHend = std::end(*m_otherHits[i]);
        float bestChi2 = m_line.chi2( *itH );
        PrHit* best = *itH;
        ++itH;
        while(itH < itHend){
          float chi2 = m_line.chi2( *itH );
          if( chi2 < bestChi2 ){
            bestChi2 = chi2;
            best = *itH;
          }
          ++itH;
        }
        m_line.addHit( best );
        m_line.solve();
      }
      xAtRef = m_line.coordAtRef();

    }else{
      // 2) Select minimal distance containing at least 5(4) different planes
      
      unsigned int nPlanes = 5; //select 5 best planes
      if(nPlanes > m_pc.nbDifferent()) nPlanes = m_pc.nbDifferent(); //well, we actually have only 4 :o
      PrPlaneCounter pc;
      PrHits::iterator itStart = it1;
      PrHits::iterator it3 = it1 + nPlanes;
      PrHits::iterator best = it1;
      float minInterval = 1.e9f;
      pc.setUnused( it1, it3 );
      while ( it3 != it2+1 ) {
        if ( pc.nbDifferent() == nPlanes ) {
          float dist = (*(it3-1))->coord() - (*it1)->coord();
          if ( dist < minInterval ) {
            minInterval = dist;
            best = it1;
          }
        }
        if ( it3 == it2 ) break;
        pc.removeHitIfUnused( *it1 );
        pc.addHitIfUnused( *it3 );
        ++it1;
        ++it3;
      }
      it1 = itStart;
      if ( minInterval < 1.f ) {
        it1 = best;
        it2 = best+nPlanes;
      }

      //== Compute average x at reference
      for ( PrHits::iterator itH = it1; it2 != itH; ++itH ) {
        if ( !(*itH)->isUsed() ) {
          coordToFit->push_back( *itH );
          xAtRef += (*itH)->coord();
        }
      }
      xAtRef /= ((float)coordToFit->size());
    }

    //=== We have a candidate :)

    //overwriting is faster than resetting, attention: values which are not overwritten do not make sense!!
    m_pc.clear();
    m_pc.set(*coordToFit); //too difficult to keep track of add and delete, just do it again..
                           // only unused(!) hits in coordToFit now
    
    bool ok = m_pc.nbDifferent() > 3;
    if(ok){
      track.replaceHits( coordToFit ); 
      setTrackParameters( track, xAtRef); 
      fastLinearFit( track );
      addHitsOnEmptyXLayers( track, side, false );
      ok = m_pc.nbDifferent() > 3;
      //== Fit and remove hits...
      m_minStereoHits = 0; //fit only X-hit, thus do not require stereo hits
      if ( ok ) ok = fitXProjection( track );
      if ( ok ) ok = track.chi2PerDoF() < m_maxChi2PerDoF;
      if ( ok ) ok = addHitsOnEmptyXLayers( track, side );
    }

    if(ok){

      for ( auto hit : track.hits()) {
        hit->setUsed();
      }

      // -- > Debug --------
      if ( m_debug ) {
        info() << "=== Storing track candidate " << trackCandidates.size() << endmsg;
        printTrack( track );
        info() << endmsg;
      }
      // -- < Debug --------

      trackCandidates.push_back( track );
    }

    //next one
    ++it1;
  }
}
//=========================================================================
//  Fit a linear form, remove the external worst as long as chi2 is big...
//=========================================================================
void PrForwardTool::fastLinearFit ( PrForwardTrack& track ) {
  

  bool fit = true;
  while ( fit ) {
    //== Fit a line
    float s0   = 0.;
    float sz   = 0.;
    float sz2  = 0.;
    float sd   = 0.;
    float sdz  = 0.;
    
    PrHits::const_iterator itEnd = track.hits().end();
    for ( PrHits::iterator itH = track.hits().begin(); itEnd != itH; ++itH ) {
      const float zHit = (*itH)->z();
      const float d = (*itH)->distanceXHit(track.x(zHit));
      const float w = (*itH)->w();
      const float z = zHit - m_zReference;
      s0   += w;
      sz   += w * z;
      sz2  += w * z * z;
      sd   += w * d;
      sdz  += w * d * z;
    }
    float den = (sz*sz-s0*sz2);
    if( !(std::fabs(den) > 1e-5))return;
    float da  = (sdz * sz - sd * sz2) / den;
    float db  = (sd *  sz - s0 * sdz) / den;
    track.updateParameters( da, db, 0.f);
    fit = false;
  
    // -- > Debug --------
    if ( UNLIKELY(m_debug) ) {
      info() << "Linear fit, current status : " << endmsg;
      printTrack( track );
    }
    // -- < Debug --------
    
    if ( track.hits().size() < m_minXHits_cur ) return;

    PrHits::iterator worst = track.hits().end();
    float maxChi2 = 0.f;
    bool notMultiple = m_pc.nbDifferent() == track.hits().size();
    //TODO how many multiple hits do we normaly have?
    //how often do we do the right thing here?
    //delete two hits at same time?
    
    for ( PrHits::iterator itH = track.hits().begin(); itEnd != itH; ++itH ) {
      float chi2 = track.chi2XHit( *itH );
      if ( chi2 > maxChi2 && ( notMultiple || m_pc.nbInPlane( (*itH)->planeCode() ) > 1 ) ) {
        maxChi2 = chi2;
        worst   = itH;
      }
    }

    //== Remove grossly out hit, or worst in multiple layers

    if ( maxChi2 > m_maxChi2LinearFit || ( !notMultiple && maxChi2 > 4.f ) ) {
    
      // -- > Debug --------
      if ( UNLIKELY(m_debug) ) {
        info() << "Remove hit ";
        printHit( *worst );
      }
      // -- < Debug --------
      
      m_pc.removeHit( *worst );
      //removing hit from track list, no need to keep track of isUsed
      std::iter_swap(worst,track.hits().end()-1); //faster than just erase, order does not matter
      track.hits().pop_back();
      fit = true;
    }
  }
}
//=========================================================================
//  Fit the X projection of a track, return OK if fit sucecssfull
//=========================================================================
bool PrForwardTool::fitXProjection ( PrForwardTrack& track ) {
  
  // -- > Debug --------
  if ( UNLIKELY(m_debug) ) {
    info() << "  -- Entering fitXProjection with:" << endmsg;
    printTrack( track );
  }
  // -- < Debug --------

  if ( m_pc.nbDifferent() < m_minXHits_cur ) {
    
    // -- > Debug --------
    if ( UNLIKELY(m_debug) ) info() << "  == Not enough layers ( "<< m_pc.nbDifferent() << " ) with hits" << endmsg;
    // -- < Debug --------

    return false;
  }
  
  bool doFit = true;
  while ( doFit ) {
    //== Fit a cubic
    float s0   = 0.f;
    float sz   = 0.f;
    float sz2  = 0.f;
    float sz3  = 0.f;
    float sz4  = 0.f;
    float sd   = 0.f;
    float sdz  = 0.f;
    float sdz2 = 0.f;

    PrHits::const_iterator itEnd = track.hits().end();
    for ( PrHits::iterator itH = track.hits().begin(); itEnd != itH; ++itH ) {
      float d = track.distance( *itH );
      float w = (*itH)->w();
      float z = .001f * ( (*itH)->z() - m_zReference );
      s0   += w;
      sz   += w * z;
      sz2  += w * z * z;
      sz3  += w * z * z * z;
      sz4  += w * z * z * z * z;
      sd   += w * d;
      sdz  += w * d * z;
      sdz2 += w * d * z * z;
    }
    float b1 = sz  * sz  - s0  * sz2;
    float c1 = sz2 * sz  - s0  * sz3;
    float d1 = sd  * sz  - s0  * sdz;
    float b2 = sz2 * sz2 - sz * sz3;
    float c2 = sz3 * sz2 - sz * sz4;
    float d2 = sdz * sz2 - sz * sdz2;

    float den = (b1 * c2 - b2 * c1 );
    if(!(std::fabs(den) > 1e-5)) return false;
    float db  = (d1 * c2 - d2 * c1 ) / den;
    float dc  = (d2 * b1 - d1 * b2 ) / den;
    float da  = ( sd - db * sz - dc * sz2) / s0;

    db = 1.e-3f * db;
    dc = 1.e-6f * dc;
    track.updateParameters( da, db, dc );


    PrHits::iterator worst = track.hits().end();
    float maxChi2 = 0.f;
    float totChi2 = 0.f;
    //int   nDoF = -3; // fitted 3 parameters
    int  nDoF = -3; 
    bool notMultiple = m_pc.nbDifferent() == track.hits().size();
    
    for ( PrHits::iterator itH = track.hits().begin(); itEnd != itH; ++itH ) {
      float chi2 = track.chi2( *itH );
      totChi2 += chi2;
      ++nDoF;
      if ( chi2 > maxChi2 && ( notMultiple || m_pc.nbInPlane( (*itH)->planeCode() ) > 1 ) ) {
        maxChi2 = chi2;
        worst   = itH;
      }
    }
    if ( nDoF < 1 )return false;
    track.setChi2( totChi2, nDoF );
  
    // -- > Debug --------
    if ( UNLIKELY(m_debug) ) {
      info() << "  -- In fitXProjection, maxChi2 = " << maxChi2 << " totCHi2/nDof " << totChi2/nDoF << endmsg;
      printTrack( track );
    }
    // -- < Debug --------

    if ( worst == itEnd ) {
      return true;
    }
    doFit = false;
    if ( totChi2/nDoF > m_maxChi2PerDoF  ||
         maxChi2 > m_maxChi2XProjection ) {
      m_pc.removeHit( *worst ); //only valid "unused" hits in track.hits()
      std::iter_swap(worst,track.hits().end()-1); //faster than just erase, order does not matter
      track.hits().pop_back();

      if ( m_pc.nbDifferent() < m_minXHits_cur + m_minStereoHits ) {
        
        // -- > Debug --------
        if ( UNLIKELY(m_debug) ) {
          info() << "  == Not enough layers with hits" << endmsg;
          printTrack( track );
        }
        // -- < Debug --------

        return false;
      }
      doFit = true;
    }
  }

  // -- > Debug --------
  if ( UNLIKELY(m_debug) ) {
    info() << "  -- End fitXProjection -- " << endmsg;
    printTrack( track );
  }
  // -- < Debug --------

  return true;
}

//=========================================================================
//  Fit the X projection of a track, return OK if fit sucecssfull
//=========================================================================
bool PrForwardTool::fitYProjection ( PrForwardTrack& track, PrHits& stereoHits ) {

  // -- > Debug --------
  if ( m_debug ) {
    info() << "  -- Entering fitYProjection with:" << endmsg;
    printTrack( track );
  }
  // -- < Debug --------

  if ( m_pc.nbDifferent() < m_minStereoHits ) {
    // -- > Debug --------
    if ( m_debug ) info() << "  == Not enough layers ( "<< m_pc.nbDifferent() << " ) with hits" << endmsg;
    // -- < Debug --------
    return false;
  }

  float maxChi2 = 1.e9f;
  bool parabola = false; //first linear than parabola

  //== Fit a line
  const float tolYMag = m_tolYMag + m_tolYMagSlope * fabs( track.xStraight(  m_zReference )-xFromVelo(  m_zReference ) );
  const float wMag   = 1./(tolYMag * tolYMag );

  bool doFit = true;
  while ( doFit ) {

    //Use position in magnet as constrain in fit
    //although bevause wMag is quite small only little influence...
    float zMag  = zMagnet();
    float dyMag = track.yStraight( zMag ) - yFromVelo( zMag );
    zMag -= m_zReference;
    float s0   = wMag;
    float sz   = wMag * zMag;
    float sz2  = wMag * zMag * zMag;
    float sd   = wMag * dyMag;
    float sdz  = wMag * dyMag * zMag;

    PrHits::const_iterator itEnd = stereoHits.end();

    if ( parabola ) {
      float sz2m = 0.;
      float sz3  = 0.;
      float sz4  = 0.;
      float sdz2 = 0.;

      for ( PrHits::iterator itH = stereoHits.begin(); itEnd != itH; ++itH ) {
        float d = - track.distance( *itH ) / (*itH)->dxDy(); //TODO multiplication much faster than division!
        float w = (*itH)->w();
        float z = (*itH)->z() - m_zReference;
        s0   += w;
        sz   += w * z;
        sz2m += w * z * z;
        sz2  += w * z * z;
        sz3  += w * z * z * z;
        sz4  += w * z * z * z * z;
        sd   += w * d;
        sdz  += w * d * z;
        sdz2 += w * d * z * z;
      }
      float b1 = sz  * sz   - s0  * sz2;
      float c1 = sz2m* sz   - s0  * sz3;
      float d1 = sd  * sz   - s0  * sdz;
      float b2 = sz2 * sz2m - sz * sz3;
      float c2 = sz3 * sz2m - sz * sz4;
      float d2 = sdz * sz2m - sz * sdz2;

      float den = (b1 * c2 - b2 * c1 );
      if(!(std::fabs(den) > 1e-5))return false;
      float db  = (d1 * c2 - d2 * c1 ) / den;
      float dc  = (d2 * b1 - d1 * b2 ) / den;
      float da  = ( sd - db * sz - dc * sz2 ) / s0;

      track.updateYParameters( da, db, dc );

      // -- > Debug --------
      if (  m_debug ){
        info() << "fitYProjection Parabolic Fit da: " << da << " db: " << db  << " dc: " << dc << endmsg;
      }
      // -- < Debug --------
    } else {

      for ( PrHits::iterator itH = stereoHits.begin(); itEnd != itH; ++itH ) {
        float d = - track.distance( *itH ) / (*itH)->dxDy(); //TODO use quick distance??
        float w = (*itH)->w();
        float z = (*itH)->z() - m_zReference;
        s0   += w;
        sz   += w * z;
        sz2  += w * z * z;
        sd   += w * d;
        sdz  += w * d * z;
      }
      float den = (s0 * sz2 - sz * sz );
      if(!(std::fabs(den) > 1e-5))return false;
      float da  = (sd * sz2 - sdz * sz ) / den;
      float db  = (sdz * s0 - sd  * sz ) / den;
      track.updateYParameters( da, db);

      // -- > Debug --------
      if (  m_debug ){
        info() << "fitYProjection Linear Fit da: " << da << " db: " << db  << endmsg;
      }
      // -- < Debug --------
    }//fit end, now doing outlier removal

    PrHits::iterator worst = std::end(stereoHits);
    maxChi2 = 0.;
    for ( PrHits::iterator itH = std::begin(stereoHits); itEnd != itH; ++itH ) {
      float chi2 = track.chi2( *itH );
      if ( chi2 > maxChi2 ) {
        maxChi2 = chi2;
        worst   = itH;
      }
    }

    if ( maxChi2 < m_maxChi2StereoLinear && !parabola ) {
      parabola = true;
      maxChi2 = 1.e9f;
      continue;
    }

    if ( maxChi2 > m_maxChi2Stereo ) {
      m_pc.removeHit( *worst ); //stereo hits never 'used'
      if ( m_pc.nbDifferent() < m_minStereoHits ) {

        // -- > Debug --------
        if ( m_debug ) info() << "-- not enough different planes after removing worst: " << m_pc.nbDifferent()
                              << " for " << m_minStereoHits << " --" << endmsg;
        // -- < Debug --------

        return false;
      }
      stereoHits.erase( worst );
      continue;
    }
 
    break;
  }

  return true;
}
//=========================================================================
//  Add hits on empty X layers, and refit if something was added
//=========================================================================
bool PrForwardTool::addHitsOnEmptyXLayers ( PrForwardTrack& track, unsigned int side, bool fullFit  ) {

  //is there an empty plane? otherwise skip here!
  if( m_pc.nbDifferent() > 11) return true;
 
  bool added = false;
  float x1 = track.hits().front()->coord();
  float xStraight = xFromVelo( m_zReference );
  float xWindow = m_maxXWindow_cur + ( fabs( x1 ) + fabs( x1 - xStraight ) ) * m_maxXWindowSlope_cur;
  //TODO better tune of window??!

  for ( unsigned int iZone=0;iZone<m_xZones.size();iZone++){
    unsigned int zoneNumber   = m_xZones[iZone] + side;
    if ( m_pc.nbInPlane( zoneNumber/2 ) != 0 ) continue;

    const float zZone = m_hitManager->zoneFast(zoneNumber)->z();
    const float xPred  = track.x( zZone );
    const float minX = xPred - xWindow;
    const float maxX = xPred + xWindow;
    float bestChi2 = 1.e9f;
    PrHit* best = nullptr;
  
    // -- Use a search to find the lower bound of the range of x values
    auto itH   = m_hitManager->getIterator_lowerBound(zoneNumber, minX);
    auto itEnd = m_hitManager->getIterator_End(zoneNumber);
    for ( ; itEnd != itH; ++itH ) { 
      if( (*itH).x() > maxX ) break;
      //if( (*itH).isUsedInTrack() ) continue;  ///TODO skip used hits here?  use 2ndbest if this is not used?! 
      
      float d = (*itH).distanceXHit(xPred); //fast distance good enough at this point (?!)
      float chi2 = d*d * (*itH).w();

      if ( chi2 < bestChi2 ) {
        bestChi2 = chi2;
        best = &*itH;
      }
    }
    if ( nullptr != best ) {
      
      // -- > Debug --------
      if ( UNLIKELY(m_debug) ) {
        info() << format( "AddHitOnEmptyXLayer:    chi2%8.2f", bestChi2 );
        printHit( best, " ");
      }
      // -- < Debug --------

      track.addHit( best );
      m_pc.addHit(best);
      added = true;
    }
  }
  if ( !added ) return true;
  if ( fullFit ) {
    return fitXProjection( track );
  }
  fastLinearFit( track );
  return true;
}


bool PrForwardTool::addHitsOnEmptyStereoLayers ( PrForwardTrack& track, PrHits& stereoHits ) {

  if(m_pc.nbDifferent()  > 5) return true;

  bool added = false;

  for ( unsigned int zoneNumber = 0; m_hitManager->nbZones() > zoneNumber; zoneNumber += 1 ) {
    PrHitZone* zone = m_hitManager->zoneFast(zoneNumber);
    if ( zone->isX() ) continue;  // exclude X zones
    if ( m_hitManager->isEmpty(zoneNumber)) continue;
    if ( m_pc.nbInPlane( zoneNumber/2 ) != 0 ) continue; //there is already one hit

    float zZone = zone->z();
    float yZone = track.y( zZone );
    zZone = zone->z( yZone );  // Correct for dzDy
    yZone = track.y( zZone );
    float xPred  = track.x( zZone );

    bool triangleSearch = std::fabs(yZone) < m_tolYTriangleSearch;
    if(!triangleSearch && (2.f*float(zoneNumber%2)-1.f) * yZone > 0.f) continue;

    //only version without triangle search!
    float dxTol = m_tolY + m_tolYSlope * ( fabs( xPred - xFromVelo( zZone ) ) + fabs( yZone ) );
    // -- Use a binary search to find the lower bound of the range of x values
    // -- This takes the y value into account
    auto itH   = m_hitManager->getIterator_lowerBound(zoneNumber, -dxTol - yZone * zone->dxDy() + xPred);
    auto itEnd = m_hitManager->getIterator_End( zoneNumber );

    PrHit* best = nullptr;
    float bestChi2 = m_maxChi2Stereo;
    if(triangleSearch){
      for ( ; itEnd != itH; ++itH ) {
        float dx = (*itH).x( yZone ) - xPred ;
        if ( dx >  dxTol ) break;
        if( yZone > (*itH).yMax() + m_yTol_UVsearch)continue;
        if( yZone < (*itH).yMin() - m_yTol_UVsearch)continue;
        float d = (*itH).distance(xPred,yZone);
        float chi2 = d*d * (*itH).w();
        if ( chi2 < bestChi2 ) {
          bestChi2 = chi2;
          best = &*itH;
        }
      }
    }else{
      //no triangle search, thus no min max check
      for ( ; itEnd != itH; ++itH ) {
          float dx = (*itH).x( yZone ) - xPred ;
          if ( dx >  dxTol ) break;
          float d = (*itH).distance(xPred,yZone);
          float chi2 = d*d * (*itH).w();
          if ( chi2 < bestChi2 ) {
            bestChi2 = chi2;
            best = &*itH;
          }
      }
    }


    if ( nullptr != best ) {
      // -- > Debug --------
      if ( m_debug ) {
        info() << format( "AddHitOnEmptyStereoLayer:    chi2%8.2f", bestChi2 );
        printHit( best, " ");
        info() << "zZone: " << zZone << " xpred: " << xPred << " dxTol " << dxTol << endmsg;
      }
      // -- < Debug --------
      stereoHits.push_back(best);
      m_pc.addHit(best);
      added = true;
    }
  } 
  if ( !added ) return true;
  return fitYProjection( track, stereoHits );
}

//=========================================================================
//  Collect all hits in the stereo planes compatible with the track
//=========================================================================
bool PrForwardTool::collectStereoHits ( PrForwardTrack& track ) {
  
  // -- > Debug --------
  if ( UNLIKELY(m_debug) ) info() << "== Collecte stereo hits. wanted ones: " << endmsg;
  // -- < Debug --------

  m_stereoHits.clear();
  unsigned int step=1; //always use triangle fix, otherwise select start side and step=2
  for ( unsigned int zoneNumber = 0; m_hitManager->nbZones() > zoneNumber; zoneNumber += step ) {
    PrHitZone* zone = m_hitManager->zoneFast(zoneNumber);
    if ( zone->isX() ) continue;  // exclude X zones
    if ( m_hitManager->isEmpty(zoneNumber)) continue;
    float zZone = zone->z();
    float yZone = track.y( zZone );
    zZone = zone->z( yZone );  // Correct for dzDy
    float xPred  = track.x( zZone );

    bool triangleSearch = std::fabs(yZone) < m_tolYTriangleSearch; 
    if(!triangleSearch && (2.f*float(zoneNumber%2)-1.f) * yZone > 0.f) continue;

    //float dxDySign = 1.f - 2.f *(float)(zone->dxDy()<0); // same as ? zone->dxDy()<0 : -1 : +1 , but faster??!!
    float dxDySign = 1.f;
    if(zone->dxDy()<0)dxDySign=-1.f;  //1.f - 2.f *(float)(zone->dxDy()<0); // same as ? zone->dxDy()<0 : -1 : +1 , but faster??!!

    // -- > Debug --------
    if ( UNLIKELY(m_debug) ) {
      for ( auto itH = m_hitManager->getIterator_Begin(zoneNumber); itH != m_hitManager->getIterator_End(zoneNumber); ++itH ) {
        if ( matchKey( &*itH ) ) {
          float tmp = (*itH).coord();
          float dx = (*itH).x( yZone ) - xPred;
          (*itH).setCoord( dx );
          printHit( &*itH, "-- " );
          (*itH).setCoord( tmp );
        }
      }
    }
    // -- < Debug --------

    float dxTol = m_tolY + m_tolYSlope * ( fabs( xPred - xFromVelo( zZone ) ) + fabs( yZone ) );

    // -- Use a binary search to find the lower bound of the range of x values
    // -- This takes the y value into account
    auto itH   = m_hitManager->getIterator_lowerBound(zoneNumber, -dxTol - yZone * zone->dxDy() + xPred);
    auto itEnd = m_hitManager->getIterator_End( zoneNumber );
    if(triangleSearch){
      for ( ; itEnd != itH; ++itH ) {
        float dx = (*itH).x( yZone ) - xPred ;
        if ( dx >  dxTol ) break;
        if( yZone > (*itH).yMax() + m_yTol_UVsearch)continue;
        if( yZone < (*itH).yMin() - m_yTol_UVsearch)continue;
        (*itH).setCoord( dx*dxDySign );
        m_stereoHits.push_back( &*itH );
      }
    }else{ //no triangle search, thus no min max check
      for ( ; itEnd != itH; ++itH ) {
          float dx = (*itH).x( yZone ) - xPred ;
          if ( dx >  dxTol ) break;
          (*itH).setCoord( dx*dxDySign );
          m_stereoHits.push_back( &*itH );
      }
    }
  }
  std::sort( m_stereoHits.begin(), m_stereoHits.end(), PrHit::LowerByCoord() );
  return m_stereoHits.size() >= m_minStereoHits;
}

//=========================================================================
//  Fit the stereo hits
//=========================================================================
bool PrForwardTool::selectStereoHits( PrForwardTrack& track ) {
  //why do we rely on xRef? --> coord() is NOT xRef for stereo HITS!

  PrHits bestStereoHits;
  std::array<float,3> originalYParams = {0.f,0.f,0.f};
  track.getYParams( originalYParams[0], originalYParams[1], originalYParams[2] );
  std::array<float,3> bestYParams = {0.f,0.f,0.f};
  float bestMeanDy       = 1e9f;

  PrHits::iterator beginRange = std::begin(m_stereoHits) - 1;
  if(m_minStereoHits > m_stereoHits.size()) return false; //otherwise crash if minHits is too large
  const PrHits::iterator endLoop = std::end(m_stereoHits) - m_minStereoHits;
  while ( beginRange < endLoop ) {
    ++beginRange;
  
    // -- > Debug --------
    if ( UNLIKELY(m_debug) ) {
      info() << " stereo start at ";
      printHit( *beginRange );
    }
    // -- > Debug --------

    m_pc.clear(); // counting now stereo hits
    PrHits::iterator endRange   = beginRange;
    float sumCoord = 0.;
    while( m_pc.nbDifferent() < m_minStereoHits ||
           (*endRange)->coord() < (*(endRange-1))->coord() + m_minYGap ) {
      m_pc.addHit( *endRange );
      sumCoord += (*endRange)->coord();
      ++endRange;
      if ( endRange == m_stereoHits.end() ) break;
    }

    //clean cluster 
    while( true ) {
      float averageCoord = sumCoord / float(endRange-beginRange);

      // remove first if not single and farest from mean
      if ( m_pc.nbInPlane( (*beginRange)->planeCode() ) > 1 &&
           ((averageCoord-(*beginRange)->coord()) > 1.0f*((*(endRange-1))->coord() - averageCoord )) ) { //tune this value has only little effect?!
        m_pc.removeHit( *beginRange );
        sumCoord -= (*(beginRange++))->coord();
        continue;
      } 

      if(endRange == m_stereoHits.end()) break; //already at end, cluster cannot be expanded anymore

      //add next, if it decreases the range size and is empty
      if ( (m_pc.nbInPlane( (*endRange)->planeCode() ) == 0)
         &&(averageCoord - (*beginRange)->coord() > (*endRange)->coord() - averageCoord )) {
        m_pc.addHit( *endRange );
        sumCoord += (*(endRange++))->coord();
        continue;
      }

      break;
    }
    
    // -- > Debug --------
    if ( UNLIKELY(m_debug) ) {
      info() << "Selected stereo range from " << endmsg;
      printHit( *beginRange );
      printHit( *(endRange-1) );
    }
    // -- < Debug --------
  
    //Now we have a candidate, lets fit him

    //track = original; //only yparams are changed
    track.setYParams(originalYParams[0], originalYParams[1], originalYParams[2]);
    PrHits stereoHits( beginRange, endRange );

    //fit Y Projection of track using stereo hits
    if(!fitYProjection(track,stereoHits))continue;

    if(!addHitsOnEmptyStereoLayers(track,stereoHits))continue;

    if(stereoHits.size() < bestStereoHits.size()) continue; //number of hits most important selection criteria!

    //== Calculate  dy chi2 /ndf
    float meanDy = 0.;
    for ( PrHits::iterator itH = std::begin(stereoHits); std::end(stereoHits) != itH; ++itH ) {
      const float dy = (*itH)->coord();
      meanDy += dy*dy;
    }
    meanDy /=  float(stereoHits.size()-1);

    if ( stereoHits.size() > bestStereoHits.size() || meanDy < bestMeanDy  ){ // if same number of hits take smaller chi2
      // -- > Debug --------
      if ( m_debug ) {
        info() << "************ Store candidate, nStereo " << stereoHits.size() << " meanDy " << meanDy << endmsg;
      }
      // -- < Debug --------
      track.getYParams(bestYParams[0],bestYParams[1],bestYParams[2]);        
      bestMeanDy       = meanDy;
      bestStereoHits   = std::move(stereoHits);
    }
    
  }
  if ( bestStereoHits.size() > 0 ) {
    track.setYParams(bestYParams[0],bestYParams[1],bestYParams[2]); //only y params have been modified
    track.addHits( bestStereoHits );
    return true;
  }
  return false;
}

//=========================================================================
//  Convert the local track to the LHCb representation
//=========================================================================
void PrForwardTool::makeLHCbTracks ( PrForwardTracks& trackCandidates, LHCb::Tracks* result ) {
  for ( PrForwardTracks::iterator itT = trackCandidates.begin();
        trackCandidates.end() != itT; ++itT ) {
    if ( !(*itT).valid() ) continue;
    LHCb::Track* tmp = (*itT).track()->clone();
    tmp->setType( LHCb::Track::Long );
    tmp->setHistory( LHCb::Track::PrForward );
    tmp->addToAncestors( (*itT).track() );

    double qOverP  = (*itT).getQoP();//calcqOverP(*itT);
    double errQop2 = 0.1 * 0.1 * qOverP * qOverP;

    std::vector<LHCb::State*>::const_iterator iStateEnd =  tmp->states().end();
    for ( std::vector<LHCb::State*>::const_iterator iState = tmp->states().begin();
          iState != iStateEnd ; ++iState ){
      (*iState)->setQOverP( qOverP );
      (*iState)->setErrQOverP2( errQop2 );
    }

    LHCb::State tState;
    double z = StateParameters::ZEndT;
    tState.setLocation( LHCb::State::AtT );
    tState.setState( (*itT).x( z ), (*itT).y( z ), z, (*itT).xSlope( z ), (*itT).ySlope( z ), qOverP );

    //== overestimated covariance matrix, as input to the Kalman fit

    tState.setCovariance( m_geoTool->covariance( qOverP ) );
    tmp->addToStates( tState );

    //== LHCb ids.

    tmp->setPatRecStatus( LHCb::Track::PatRecIDs );

    PrHits::iterator iHitEnd = (*itT).hits().end();
    for ( PrHits::iterator itH = (*itT).hits().begin(); iHitEnd != itH; ++itH ) {
      tmp->addToLhcbIDs( (*itH)->id() );
      //mark hits as used (for seeding)
      if((*itT).quality() < 0.8 )(*itH)->setUsedInTrack(); //set for ghostfree tracks hits as used for sseding
    }
    tmp->setChi2PerDoF( (*itT).chi2PerDoF() );
    tmp->setNDoF(       (*itT).nDoF() );
    tmp->addInfo( LHCb::Track::PatQuality, (*itT).quality() );

    //ADD UT hits on track
    if ( NULL != m_addUTHitsTool  &&  !m_useMomentumEstimate) { //FIXME switch of if veloUT tracks as input
      StatusCode sc = m_addUTHitsTool->addUTHits( *tmp );
      if (sc.isFailure()){
        if( UNLIKELY( msgLevel(MSG::DEBUG) ) )
          debug()<<" Failure in adding UT hits to track"<<endmsg;
      }
    }

    result->insert( tmp );
  
    // -- > Debug --------
    if ( m_debug ) info() << "Store track " << (*(result->end()-1))->key()
                          << " quality " << (*(result->end()-1))->info( LHCb::Track::PatQuality, 0. ) << endmsg;
    // -- < Debug --------
  }
  
}


void PrForwardTool::merge6Sorted(PrHits& allXHits, std::vector<int> &boundaries){

  //if(boundaries.size() != 7) return;

  auto it1_b = allXHits.begin() + boundaries[0];
  auto it1_m = allXHits.begin() + boundaries[1];
  auto it1_e = allXHits.begin() + boundaries[2];

  auto it2_b = allXHits.begin() + boundaries[2];
  auto it2_m = allXHits.begin() + boundaries[3];
  auto it2_e = allXHits.begin() + boundaries[4];

  auto it3_b = allXHits.begin() + boundaries[4];
  auto it3_m = allXHits.begin() + boundaries[5];
  auto it3_e = allXHits.begin() + boundaries[6];


  //check if memory is large enough
  if( UNLIKELY(   ((it1_e - it1_b)>m_sizeMergeTmp1) || ((it2_e - it2_b)>m_sizeMergeTmp1) || ((it3_e - it3_b)>m_sizeMergeTmp1) ) ){
    m_sizeMergeTmp1  = 1.2 * std::max( it1_e - it1_b    , std::max(  it2_e - it2_b, it3_e - it3_b   ) );
    m_MergeTmp1  = (PrHit**) realloc(m_MergeTmp1,  sizeof(PrHit*) * m_sizeMergeTmp1);
    m_MergeTmp2  = (PrHit**) realloc(m_MergeTmp2, sizeof(PrHit*) * m_sizeMergeTmp1);
  }
  if( UNLIKELY( it1_e - it1_b + it2_e - it2_b > m_sizeMergeTmp2 )){
    m_sizeMergeTmp2   = 1.2 * ( it1_e - it1_b + it2_e - it2_b  );
    m_MergeTmp1_1 = (PrHit**) realloc(m_MergeTmp1_1,   sizeof(PrHit*) * ( m_sizeMergeTmp2 ));
  } 

  //merge 0-2
  std::merge( it1_b,it1_m,it1_m,it1_e,m_MergeTmp1,PrHit::LowerByCoord());
  //merge 2-4
  std::merge( it2_b,it2_m,it2_m,it2_e,m_MergeTmp2,PrHit::LowerByCoord());
  //merge 0-4
  std::merge(  m_MergeTmp1,
               m_MergeTmp1 + (int)(it1_e-it1_b),
               m_MergeTmp2,
               m_MergeTmp2 + (int)(it2_e-it2_b),
               m_MergeTmp1_1,
               PrHit::LowerByCoord()
  );
  //merge 4-6
  std::merge( it3_b,it3_m,it3_m,it3_e,m_MergeTmp2,PrHit::LowerByCoord());
  //merge all
  std::merge(  m_MergeTmp1_1,
               m_MergeTmp1_1 + (int)(it1_e - it1_b + it2_e - it2_b),
               m_MergeTmp2,
               m_MergeTmp2 + (int)(it3_e - it3_b),
               allXHits.begin(),
               PrHit::LowerByCoord()
  );

}


// ############ original PrGeometryTool #######################3

//=========================================================================
//  Compute the x projection at the reference plane
//=========================================================================
void PrForwardTool::xAtRef_SamePlaneHits(PrHits::iterator itH, PrHits::iterator itEnd) {

  //calculate xref for this plane
  const float zHit    = (*itH)->z(); //all hits in same layer
  //const float yHit    = track.yFromVelo( zHit );
  const float xFromVelo_Hit = xFromVelo(zHit);
  const float zMagSlope = m_zMagnetParams[2] * m_tx2 +  m_zMagnetParams[3] * m_ty2;

  while( itEnd>itH ){
    PrHits::iterator itH2 = itH;
    for(int i=0;i<8&&itH2<itEnd;++i,++itH2){
      m_xHits[i] = (*itH2)->x();
    }
    //loop should now auto vectorize 'note: LOOP VECTORIZED.'
    for (int i=0;i<8;i++) {
      const float xHit    = m_xHits[i]; //ignore slope in z for ALL X-hits should be fine??!!!
      const float dSlope  = ( xFromVelo_Hit - xHit ) / ( zHit - m_zMagnetParams[0]);
      const float zMag    = m_zMagnetParams[0] + m_zMagnetParams[1] *  dSlope * dSlope  + zMagSlope;
      const float xMag    = xFromVelo_Hit + m_tx * (zMag - zHit);
      const float dz      = 1.e-3f * ( zHit - m_zReference );
      const float dxCoef  = dz * dz * ( m_xParams[0] + dz * m_xParams[1] ) * dSlope;
      const float ratio   = (  m_zReference - zMag ) / ( zHit - zMag );
      const float x       = xMag + ratio * (xHit + dxCoef  - xMag);
      m_xHits[i] = x;
    }
    for(int i=0;i<8 && itH!=itEnd;++i,++itH){
      (*itH)->setCoord(m_xHits[i]);
    }
  }

}

//=========================================================================
//  Set the parameters of the track, from the (average) x at reference
//=========================================================================
//TODO move to PrForwardTool
void PrForwardTool::setTrackParameters ( PrForwardTrack& track, const float xAtRef) {

  float dSlope  = ( xFromVelo(m_zReference) - xAtRef ) / ( m_zReference - m_zMagnetParams[0]);
  const float zMagSlope = m_zMagnetParams[2] * m_tx2 +  m_zMagnetParams[3] * m_ty2;
  const float zMag    = m_zMagnetParams[0] + m_zMagnetParams[1] *  dSlope * dSlope  + zMagSlope;
  const float xMag    = xFromVelo( zMag );
  const float slopeT  = ( xAtRef - xMag ) / ( m_zReference - zMag );
  dSlope        = slopeT - m_tx;
  const float dyCoef  = dSlope * dSlope * m_ty;

  track.setParameters( xAtRef,
                       slopeT,
                       1.e-6 * m_xParams[0] * dSlope,
                       1.e-9 * m_xParams[1] * dSlope,
                       yFromVelo( m_zReference ),
                       m_ty + dyCoef * m_byParams[0],
                       dyCoef * m_cyParams[0] );
}

//=========================================================================
//  Returns the best momentum estimate
//=========================================================================
float PrForwardTool::calcqOverP ( const PrForwardTrack& track) {

  float qop(1.0f/Gaudi::Units::GeV) ;
  float magscalefactor = m_geoTool->magscalefactor();
  if( std::abs(magscalefactor) > 1e-6f ) {
    float bx   = track.xSlope( m_zReference );
    float bx2  = bx * bx;
    float coef = ( m_momentumParams[0] +
                   m_momentumParams[1] * bx2 +
                   m_momentumParams[2] * bx2 * bx2 +
                   m_momentumParams[3] * bx * m_tx +
                   m_momentumParams[4] * m_ty2 +
                   m_momentumParams[5] * m_ty2 * m_ty2 );
    float proj = sqrt( ( 1.f + m_slope2 ) / ( 1.f + m_tx2 ) );
    qop = ( m_tx - bx ) / ( coef * Gaudi::Units::GeV * proj * magscalefactor) ;
  }
  return qop ;

}

//=========================================================================
//  Returns estimate of magnet kick position
//=========================================================================
float PrForwardTool::zMagnet() {
  return ( m_zMagnetParams[0] +
           m_zMagnetParams[2] * m_tx2 +
           m_zMagnetParams[3] * m_ty2 );
}


