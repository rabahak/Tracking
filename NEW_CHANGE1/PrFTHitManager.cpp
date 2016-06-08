// Include files 

// from Gaudi
#include "Event/FTLiteCluster.h"
#include "GaudiKernel/IRndmGenSvc.h"
// local
#include "PrFTHitManager.h"

//#include  "Kernel/FTChannelID.h"

//-----------------------------------------------------------------------------
// Implementation file for class : PrFTHitManager
//
// 2012-03-13 : Olivier Callot
//-----------------------------------------------------------------------------

// Declaration of the Tool Factory
DECLARE_TOOL_FACTORY( PrFTHitManager )


//=============================================================================
// Standard constructor, initializes variables
//=============================================================================
PrFTHitManager::PrFTHitManager( const std::string& type,
                                  const std::string& name,
                                  const IInterface* parent )
: PrHitManager ( type, name , parent )
{
  declareInterface<PrFTHitManager>(this);
  declareProperty( "XSmearing",   m_xSmearing = -1. );
  declareProperty( "ZSmearing",   m_zSmearing = -1. );

}
//=============================================================================
// Destructor
//=============================================================================
PrFTHitManager::~PrFTHitManager() {}

//=========================================================================
//  Create the zones in the hit manager, 'zone' is a method of the base class
//=========================================================================
void PrFTHitManager::buildGeometry ( ) {  
  
  // -- only build geometry once.
  if(m_geometryBuilt) return;
  

  IRndmGenSvc* randSvc = svc<IRndmGenSvc>( "RndmGenSvc", true );
  StatusCode sc = m_gauss.initialize( randSvc, Rndm::Gauss( 0., 1. ) );
  if ( sc.isFailure() ){
    error() << "Could not initialize Rndm::Gauss generator" << endmsg;
    return;
  }
  
    
  m_ftDet = getDet<DeFTDetector>( DeFTDetectorLocation::Default );
  //version 20 is the detector with monolayer and fibremat structure, including the dead regions
  if ( msgLevel( MSG::DEBUG) )  debug() << "DETECTOR VERSION: " << m_ftDet->version() << endmsg;  
  //Different Detector Segments has to be used to set the geometry of zone Up and Down to be consistent with new DeFTFibreMat
  DetectorSegment segUp;
  DetectorSegment segDown;
  for ( std::vector<DeFTLayer*>::const_iterator itL = m_ftDet->layers().begin();  //loop over layers
	m_ftDet->layers().end() != itL; ++itL ) {
    int id = (*itL)->params()->param<int>("layerID");  //ask layerID
    
    //FTChannelID (layer,module,mat,SiPMID,netCellID)
    LHCb::FTChannelID ChUp( id, 0u, 0u, 0u, 0u ); //"0u" means "unsigned 0" 
    const DeFTFibreMat* ftMatUp = m_ftDet->findFibreMat(ChUp);
    segUp = ftMatUp->createDetSegment( ChUp, 0. );
    
    LHCb::FTChannelID ChDown( id, 0u, 1u, 0u, 0u ); //"0u" means "unsigned 0"
    const DeFTFibreMat* ftMatDown = m_ftDet->findFibreMat(ChDown);
    segDown = ftMatDown->createDetSegment( ChDown, 0. );

    if ( msgLevel( MSG::DEBUG) ) debug() << "STEREO ANGLE Up: " <<  ftMatUp->angle() << endmsg;
    if ( msgLevel( MSG::DEBUG) ) debug() << "STEREO ANGLE Down: " <<  ftMatDown->angle() << endmsg;
    
    //The setGeometry defines the z at y=0, the dxDy and the dzDy, as well as the isX properties of the zone. 
    //This is important, since these are used in the following. 
    //They are set once for each zone in this method.
    zone( 2*id   )->setGeometry( segUp ); // ex:layers 0  down (up with new FTChannelID)
    zone( 2*id+1 )->setGeometry( segDown ); // ex:layers 0  up (down with new FTChannelID)
    //The boundaries are needed in case you will use the m_xMin, m_xMax, m_yMin, m_yMax of the zone, 
    //or methods that are indirectly using them, like dxOnAFibre() or isInside(x,y) 
    //(see https://svnweb.cern.ch/trac/lhcb/browser/Rec/trunk/Pr/PrKernel/PrKernel/PrHitZone.h?rev=164716). 
    //These are currently not used anywhere in the seeding algorithm.
    //The isInside(x,y) method is used in the forward algorithm. 
    zone( 2*id+1 )->setBoundaries( -4090., 4090., -3030., 50. ); //check these boudaries for zone down (with new FTChannelID)
    zone( 2*id   )->setBoundaries( -4090., 4090., -50., 3030. ); //check these boudaries for zone up (with new FTChannelID) 
    if ( msgLevel( MSG::DEBUG) ) debug() << "Layer " << id << " z " << zone(2*id)->z() 
                                         << " angle " << zone(2*id)->dxDy() << endmsg;
  }
  if ( msgLevel( MSG::DEBUG) ) debug() << "XSmearing " << m_xSmearing << " ZSmearing " << m_zSmearing << endmsg;
  
  m_geometryBuilt = true;
  

}


//=========================================================================
//  Decode an event.
//=========================================================================
void PrFTHitManager::decodeData ( ) {
  
  if(m_decodedData) return;

  if ( msgLevel( MSG::DEBUG) ) debug() << "I AM IN DECODEDATA " << endmsg;
  
  typedef FastClusterContainer<LHCb::FTLiteCluster,int> FTLiteClusters;
  FTLiteClusters* clus = get<FTLiteClusters>( LHCb::FTLiteClusterLocation::Default );
  if ( msgLevel( MSG::DEBUG) ) debug() << "Retrieved " << clus->size() << " clusters" << endmsg;
  const DeFTFibreMat* ftMat = nullptr;
  const DeFTFibreMat* anaFtMat = nullptr;
  unsigned int oldFibreMatID = 99999999;
    
  DetectorSegment seg ; 
  
  for ( FTLiteClusters::iterator itC = clus->begin(); clus->end() != itC; ++itC ) {
    /// find fibremat to which the cluster belongs 
    anaFtMat = m_ftDet->findFibreMat( (*itC).channelID() );
    if(anaFtMat->FibreMatID() != oldFibreMatID)  { 
      oldFibreMatID =  anaFtMat->FibreMatID();
      ftMat =  anaFtMat; 
      if ( nullptr == ftMat ) {
        info() << "FiberMat not found for FT channelID " << (*itC).channelID() << endmsg; 
        oldFibreMatID = 99999999;   
      } 
    }


  
    double fraction = (*itC).fraction() + 0.125;   // Truncated to 4 bits = 0.25. Add half of it
    LHCb::FTChannelID id = (*itC).channelID();

    int lay  = (*itC).channelID().layer();  
    int zone = (int)((*itC).channelID().mat() > 0);  //if yes, it is bottom (now bottom is 1)
    int code = 2*lay + zone;

    //variables
    const double fibreMatHalfSizeY = ftMat->getFibreMatHalfSizeY();
    const double cellSizeX = ftMat->getCellSizeX();
    const float dzDy = ftMat->getDzDy();
    const float dxDy = -ftMat->getTanAngle();// = -m_tanAngle
    const double hitLocalX = ftMat->cellLocalX(id) + fraction*cellSizeX;
    double xx, xy, xz, dx, yx, yy, yz, dy, zx, zy, zz, dz;
    ftMat->geometry()->toGlobalMatrix().GetComponents( xx, xy, xz, dx, yx, yy, yz, dy, zx, zy, zz, dz );

    //const float yBorder = yx* hitLocalX + yy * (2*zone-1)*fibreMatHalfSizeY + dy;
    const float yMin = yx* hitLocalX - yy *fibreMatHalfSizeY + dy;
    const float yMax = yx* hitLocalX + yy *fibreMatHalfSizeY + dy;

    //calculate hit x,z at y=0 in global frame (as local y=0 NOT global y=0)
    const double hitGlobala_X = hitLocalX * xx + dx;
    const double hitGlobalb_X = hitGlobala_X + fibreMatHalfSizeY*xy;
    const double hitGlobala_Y = hitLocalX * yx+ dy;
    const double hitGlobalb_Y = hitGlobala_Y + fibreMatHalfSizeY*yy;
    const double hitGlobala_Z = hitLocalX * zx + dz;
    const double hitGlobalb_Z = hitGlobala_Z + fibreMatHalfSizeY*zy;
    const double axy = (hitGlobala_X-hitGlobalb_X)/(hitGlobala_Y-hitGlobalb_Y);
    const double azy = (hitGlobala_Z-hitGlobalb_Z)/(hitGlobala_Y-hitGlobalb_Y);
    const float x0 = hitGlobalb_X-axy*hitGlobalb_Y;
    const float z0 = hitGlobalb_Z-azy*hitGlobalb_Y;

    PrHit* aHit = newHitInZone( code );
    float errX = 0.05 + .03 * (*itC).size();
    aHit->setHit( LHCb::LHCbID( (*itC).channelID() ), x0, z0, dxDy, dzDy, yMin, yMax, errX , zone, lay );

    if ( UNLIKELY(msgLevel( MSG::DEBUG)) ) info() << " .. hit " << (*itC).channelID() << " zone " << zone << " x " << seg.x(0.) << endmsg;
  }


  for ( unsigned int lay = 0; nbZones() > lay ; ++lay ) {
     std::sort( getIterator_Begin(lay), getIterator_End(lay), PrHit::LowerByX0() );
  }

  m_decodedData = true;
  
}
//=============================================================================

//ADDED_Rabah
void PrFTHitManager::InitializeBB_id(IterPairs &BB){
    unsigned int ZoneNumber=(*BB.first).zone();//TOCHECK
        BB.first=getIterator_Begin(ZoneNumber);
        BB.second=getIterator_End(ZoneNumber);
}

//note: ZoneNum could be obtained from BB,(Prhit.zone()) but ZoneNum contains in addition the (part) information related to the position where this method is called in findXProjection
void PrFTHitManager::UpdateB1B2(IterPairs &BB,float min,float max)
{//Note: while updating BBpairs in last layer... the check is not needed, but this function is generalised for every case (you can implement one just for last)
    //std::vector<PrHit*>::iterator BB.first
    unsigned int ZoneNumber=(*BB.first).zone(); //ASK RENATO if inline int   zone()  const { return (m_info &  uint(64))>>6; } in PrHit.h return the zone number
    
    
    if(min>(*BB.first).x())
        BB.first  = m_hitManager->getUP_lowerBound( ZoneNumber,BB.first, min);
    else
        if(min<(*BB.first).x())
            BB.first  = m_hitManager->getDOWN_lowerBound( ZoneNumber,BB.first, min);
        
    if(max>(*BB.second).x())
        BB.second = m_hitManager->getUP_upperBound( ZoneNumber,BB.second, max);
    else
        if(max<(*BB.second).x())
            BB.second = m_hitManager->getDOWN_upperBound( ZoneNumber,BB.second, max);
        
}

void PrFTHitManager::UpdateB1(IterPairs &BB,float min,float max) //to use in middle layers
{
    //std::vector<PrHit*>::iterator BB.first
    unsigned int ZoneNumber=(*BB.first).zone(); //ASK RENATO if inline int   zone()  const { return (m_info &  uint(64))>>6; } in PrHit.h return the zone number
    
    if(min>(*BB.first).x())
    BB.first  = m_hitManager->getUP_lowerBound( ZoneNumber,BB.first, min);
    else
        if(min<(*BB.first).x())
            BB.first  = m_hitManager->getDOWN_lowerBound( ZoneNumber,BB.first, min);
        
    BB.second = m_hitManager->getIterator_End( ZoneNumber);
    
}

bool PrFTHitManager::EnoughLayersFired(Boundaries &Bounds)
{
    unsigned int nb=1;
    for(unsigned int i=1;i<NLAYERS;i++)
    {if(Bounds[i].second-Bounds[i].first!=0) //found at least one hit
        nb++;}
    if(nb>=5)
        return true;
    else
        return false;
}










