// Include files 

// local
#include "PrMatchNN.h"

//-----------------------------------------------------------------------------
// Implementation file for class : PrMatchNN
//
// 2013-11-15 : Michel De Cian, migration to Upgrade
//
// 2007-02-07 : Olivier Callot
//-----------------------------------------------------------------------------

// Declaration of the Algorithm Factory
DECLARE_ALGORITHM_FACTORY( PrMatchNN )

//=============================================================================
// Standard constructor, initializes variables
//=============================================================================
PrMatchNN::PrMatchNN( const std::string& name,
                    ISvcLocator* pSvcLocator)
  : GaudiAlgorithm ( name , pSvcLocator )
  , m_matchTool(NULL)
{
  declareProperty( "VeloInput"       , m_veloLocation  = LHCb::TrackLocation::Velo );
  declareProperty( "SeedInput"       , m_seedLocation  = LHCb::TrackLocation::Seed );
  declareProperty( "MatchOutput"     , m_matchLocation = LHCb::TrackLocation::Match );
  declareProperty( "MatchToolName",    m_matchToolName = "PrMatchToolNN" );
}
//=============================================================================
// Destructor
//=============================================================================
PrMatchNN::~PrMatchNN() {} 

//=============================================================================
// Initialization
//=============================================================================
StatusCode PrMatchNN::initialize() {
  StatusCode sc = GaudiAlgorithm::initialize(); // must be executed first
  if ( sc.isFailure() ) return sc;  // error printed already by GaudiAlgorithm

  if( UNLIKELY( msgLevel(MSG::DEBUG) ) ) debug() << "==> Initialize" << endmsg;

  m_matchTool = tool<IMatchTool>(m_matchToolName, this);
  return StatusCode::SUCCESS;
}

//=============================================================================
// Main execution
//=============================================================================
StatusCode PrMatchNN::execute()
{
  LHCb::Tracks* matchs = new LHCb::Tracks;
  
  if(m_matchToolName != "PrTuningMatchToolNN"){
    put(matchs, m_matchLocation);
    matchs->reserve(200);
  }

  LHCb::Tracks* velos  = getIfExists<LHCb::Tracks>( m_veloLocation );
  if ( nullptr == velos ) {
    error() << "Track container '" << m_veloLocation << "' does not exist" <<endmsg;
    return StatusCode::SUCCESS;
  }
  
  LHCb::Tracks* seeds  = getIfExists<LHCb::Tracks>( m_seedLocation ); 
  if ( nullptr == seeds ) {
    error() << "Track container '" << m_seedLocation << "' does not exist" <<endmsg;
    return StatusCode::SUCCESS;
  }

  StatusCode sc = m_matchTool->match( *velos , *seeds , *matchs);
  
  if(sc.isFailure()) Warning("PrMatchTool failed",sc).ignore();
  
  return sc;
}
 
//=============================================================================
//  Finalize
//=============================================================================
StatusCode PrMatchNN::finalize() {

  if( UNLIKELY( msgLevel(MSG::DEBUG) ) ) debug() << "==> Finalize" << endmsg;

  return GaudiAlgorithm::finalize();  // must be called after all other actions
}

//=============================================================================
