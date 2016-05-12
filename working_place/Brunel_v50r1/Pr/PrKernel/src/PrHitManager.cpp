// Include files 

// local
#include "PrKernel/PrHitManager.h"

//-----------------------------------------------------------------------------
// Implementation file for class : PrHitManager
//
// 2012-03-13 : Olivier Callot
//-----------------------------------------------------------------------------

//=============================================================================
// Standard constructor, initializes variables
//=============================================================================
PrHitManager::PrHitManager( const std::string& type, 
                              const std::string& name,
                              const IInterface* parent) 
  : GaudiTool ( type, name , parent ) 
{
  declareInterface<PrHitManager>(this);
}
//=============================================================================
// Destructor
//=============================================================================
PrHitManager::~PrHitManager() { 
}
//=============================================================================
// Initialization
//=============================================================================
StatusCode PrHitManager::initialize(){
  StatusCode sc = GaudiTool::initialize(); // must be executed first
  if ( sc.isFailure() ) return sc;  // error printed already by GaudiAlgorithm
  
  if ( msgLevel(MSG::DEBUG) ) debug() << "==> Initialize" << endmsg;
  
  // invalidate measurements at the beginning of each event
  incSvc()->addListener(this, IncidentType::BeginEvent);
  m_maxSize = 0;
  m_eventReady = false;
  
  return StatusCode::SUCCESS;
}

//=============================================================================
// Finalization
//=============================================================================
StatusCode PrHitManager::finalize() {
  info() << "Maximum number of hits " << m_maxSize << endmsg;
  
  return GaudiTool::finalize();
}
//=============================================================================
