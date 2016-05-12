// $Id: $
#ifndef PRKERNEL_PRHITMANAGER_H 
#define PRKERNEL_PRHITMANAGER_H 1

// Include files
// from Gaudi
#include "GaudiAlg/GaudiTool.h"
#include "GaudiKernel/IIncidentSvc.h"
#include "GaudiKernel/IIncidentListener.h"
#include "PrKernel/PrHit.h"
#include "PrKernel/PrHitZone.h"

static const InterfaceID IID_PrHitManager ( "PrHitManager", 1, 0 );

/** @class PrHitManager PrHitManager.h PrKernel/PrHitManager.h
 *  Hit manager for the PrHits
 *
 *  @author Olivier Callot
 *  @date   2012-03-13
 *  @author Thomas Nikodem
 *  @date   2016-04-26
 */
class PrHitManager : public GaudiTool, public IIncidentListener {
public: 

  // Return the interface ID
  static const InterfaceID& interfaceID() { return IID_PrHitManager; }

  /// Standard constructor
  PrHitManager( const std::string& type, 
                 const std::string& name,
                 const IInterface* parent);

  virtual ~PrHitManager( ); ///< Destructor

  virtual StatusCode initialize();
  virtual StatusCode finalize();

  virtual void buildGeometry() {};
  virtual void decodeData()    {};
  
  /// Clear the zones, and reset the hit pointer. Store the maximum size.
  void clearHits() {
    
    for(unsigned int i=0;i<m_hits.size();i++){
      if( LIKELY(m_hits[i] != nullptr)  )m_hits[i]->clear();
    }
  };

  /// Handle the incident 'BeginEvent': Invalidate the decoding
  void handle ( const Incident& incident ) {
    if ( IncidentType::BeginEvent == incident.type() ){
      this->clearHits();
      m_eventReady = false;
    }
  };

  /// Return a new hit assigned to the specified zone
  PrHit* newHitInZone( unsigned int lay ) {
    if(UNLIKELY(  1+lay>m_hits.size())){ //TODO how much time does this check take? do we need it?
      while( 1+lay > m_hits.size()){
        auto tmp = std::unique_ptr< std::vector<PrHit> >(new std::vector<PrHit>() );
        tmp->reserve(500); // TODO 500 enough?
        m_hits.push_back(std::move(tmp)); 
        
      }
    }
    (m_hits[lay])->emplace_back(PrHit());
    return &(m_hits[lay]->back());
  }
  

  /// Access a zone. Create it if needed...
  PrHitZone* zone( unsigned int n ) { 
    while( m_zones.size() <= n ) {
      auto tmp = std::unique_ptr<PrHitZone>(new PrHitZone( m_zones.size()));
      m_zones.push_back( std::move(tmp) );
    }
    return m_zones[n].get();
  }

  PrHitZone* zoneFast( unsigned int n ) { 
   return m_zones[n].get();
  }
  /// Return the current number of zones
  unsigned int nbZones()   const { return m_zones.size();   }
  
  // this is the time critical method! actually no, already quite fast...
  std::vector<PrHit>::iterator getIterator_lowerBound(unsigned int lay, float xMin){
    // is there gain by a lookup table? dont think so but maybe we can test..
    //search
    return std::lower_bound( getIterator_Begin(lay), getIterator_End(lay), xMin ,
                             [](const PrHit& a, const float testval) -> bool { return a.x() < testval;} );
  }
  
  std::vector<PrHit>::iterator getIterator_upperBound(unsigned int lay, float xMax){
    return std::upper_bound( getIterator_Begin(lay), getIterator_End(lay), xMax ,
                             [](const float testval, const PrHit& a) -> bool { return a.x() > testval ; });
  }
  
  
  std::vector<PrHit>::iterator getIterator_Begin(unsigned int lay){
    return std::begin( *(m_hits[lay]) );
  }
  std::vector<PrHit>::iterator getIterator_End(unsigned int lay){
    return std::end( *(m_hits[lay]) );
  }
  
  bool isEmpty(unsigned int lay) {return getIterator_End(lay) == getIterator_Begin(lay);}
  
protected:

private:

  //THE HITS SAVED HERE
  std::vector< std::unique_ptr<std::vector<PrHit> > >      m_hits;
  //Geometrical infos about different layers, also called zones
  std::vector< std::unique_ptr<PrHitZone> >            m_zones; //does not work lhcb framework??!!

  int              m_maxSize;
  bool             m_eventReady;
};
#endif // PRKERNEL_PRHITMANAGER_H
