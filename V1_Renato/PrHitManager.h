#ifndef PRKERNEL_PRHITMANAGER_H
#define PRKERNEL_PRHITMANAGER_H 1

// Include files
// from Gaudi
#include "GaudiAlg/GaudiTool.h"
#include "GaudiKernel/IIncidentSvc.h"
#include "GaudiKernel/IIncidentListener.h"
#include "PrKernel/PrHit.h"
#include "PrKernel/PrHitZone.h"
#ifndef NLAYERS
#define NLAYERS 6
#endif


static const InterfaceID IID_PrHitManager ( "PrHitManager", 1, 0 );

typedef std::vector<PrHit>::iterator HitIterat;
struct IterPairs{
    HitIterat begin;
    HitIterat end;
};
typedef std::array< IterPairs, NLAYERS > Boundaries;

/** @class PrHitManager PrHitManager.h PrKernel/PrHitManager.h
 *  Hit manager for the PrHits
 *
 *  @author Olivier Callot
 *  @date   2012-03-13
 *  @author Thomas Nikodem
 *  @date   2016-04-26
 *  @author Renato Quagliani
 *  @data   2016-06-14
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
        m_decodedData = false;
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
    // Hit handling/ sorting etc...
    class compX{
    public:
        inline bool operator()(      float  lv,        float  rv)  const{return lv < rv;}
        inline bool operator()(const PrHit& lhs,       float  rv)  const{return (*this)(lhs.x(),  rv);}
        inline bool operator()(      float  lv,  const PrHit& rhs) const{return (*this)(lv,       rhs.x());}
        inline bool operator()(const PrHit& lhs, const PrHit& rhs) const{return (*this)(lhs.x(),  rhs.x());}
        inline bool operator()(const PrHit* lhs,       float  rv)  const{return (*this)(lhs->x(), rv);}
        inline bool operator()(      float  lv,  const PrHit* rhs) const{return (*this)(lv,       rhs->x());}
        inline bool operator()(const PrHit* lhs, const PrHit* rhs) const{return (*this)(lhs->x(), rhs->x());}
    };
    class compXreverse{
    public:
        inline bool operator()(      float  lv,        float  rv)  const{return lv > rv;}
        inline bool operator()(const PrHit& lhs,       float  rv)  const{return (*this)(lhs.x(),  rv);}
        inline bool operator()(      float  lv,  const PrHit& rhs) const{return (*this)(lv,       rhs.x());}
        inline bool operator()(const PrHit& lhs, const PrHit& rhs) const{return (*this)(lhs.x(),  rhs.x());}
        inline bool operator()(const PrHit* lhs,       float  rv)  const{return (*this)(lhs->x(), rv);}
        inline bool operator()(      float  lv,  const PrHit* rhs) const{return (*this)(lv,       rhs->x());}
        inline bool operator()(const PrHit* lhs, const PrHit* rhs) const{return (*this)(lhs->x(), rhs->x());}
    };
    
    template <class ForwardIt, class T>
    ForwardIt linear_lower_bound(ForwardIt first, ForwardIt last, T value){
        while (first != last && *first < value) ++first;
        return first;
    }
    
    template <class ForwardIt, class T, class Compare>
    ForwardIt linear_lower_bound(ForwardIt first, ForwardIt last, T value, Compare comp){
        while (first != last && comp(*first, value)) ++first;
        return first;
    }
    
    template <class ForwardIt, class T>
    ForwardIt linear_upper_bound(ForwardIt first, ForwardIt last, T value){
        while (first != last && !(value < *first)) ++first;
        return first;
    }
    template <class ForwardIt, class T, class Compare>
    ForwardIt linear_upper_bound(ForwardIt first, ForwardIt last, T value, Compare comp){
        while(first != last && !comp(value, *first)) ++first;
        return first;
    }
    
    //search lowerBound given a layer in log time
    HitIterat getIterator_lowerBound(unsigned int lay, float xMin){
        return std::lower_bound( getIterator_Begin(lay), getIterator_End(lay), xMin ,
                                [](const PrHit& a, const float testval) -> bool { return a.x() < testval;} );
    }
    
    //search upperBound given a layer in log timing
    HitIterat getIterator_upperBound(unsigned int lay, float xMax){
        return std::upper_bound( getIterator_Begin(lay), getIterator_End(lay), xMax ,
                                [](const float testval, const PrHit& a) -> bool { return a.x() > testval ; });
    }
    
    //search lowerBound from known position to another known position ( log time)
    HitIterat get_lowerBound_log(HitIterat& given_it, HitIterat& end, float xMin){
        return std::lower_bound(given_it, end, xMin, compX());
    }
    //search upperBound from a known position to another known position (log time)
    HitIterat get_upperBound_log(HitIterat& given_it, HitIterat& end,float xMax){
        return std::upper_bound( given_it, end, xMax, compX());
    }
    //search lowerBound from a known position to another known position (linear time)
    HitIterat get_lowerBound_lin(HitIterat& given_it, HitIterat&end, float xMin){
        return linear_lower_bound( given_it , end, xMin, compX());
    }
    //search upperBound from known position to another known position (linear time)
    HitIterat get_upperBound_lin(HitIterat& given_it, HitIterat& end, float xMax){
        return linear_upper_bound( given_it, end, xMax, compX());
    }
    //search with STL method a lowerBound in low/high range starting from high
    HitIterat get_lowerBound_log_reverse( HitIterat& low, HitIterat& high, float xMin){
        std::reverse_iterator<HitIterat> revBegin(high);
        std::reverse_iterator<HitIterat> revEnd(low);
        std::reverse_iterator<HitIterat> revLower = std::upper_bound( revBegin, revEnd, xMin, compXreverse());
        return revLower.base();
    }
    //search with STL method an upper bond in low/high range starting from high
    HitIterat get_upperBound_log_reverse( HitIterat& low, HitIterat& high, float xMax){
        std::reverse_iterator<HitIterat> revBegin(high);
        std::reverse_iterator<HitIterat> revEnd(low);
        std::reverse_iterator<HitIterat> revUpper = std::lower_bound( revBegin, revEnd, xMax, compXreverse());
        return revUpper.base();
    }
    
    //search linearly a lowerBound in low/high range starting from high
    HitIterat get_lowerBound_lin_reverse( HitIterat&low, HitIterat& high, float xMin){
        std::reverse_iterator<HitIterat> revBegin(high);
        std::reverse_iterator<HitIterat> revEnd(low);
        std::reverse_iterator<HitIterat> revLower = linear_upper_bound( revBegin, revEnd, xMin, compXreverse());
        return revLower.base();
    }
    
    //search linearly an upperBound in low/high range starting from high
    HitIterat get_upperBound_lin_reverse( HitIterat& low, HitIterat& high, float xMax){
        std::reverse_iterator<HitIterat> revBegin(high);
        std::reverse_iterator<HitIterat> revEnd(low);
        std::reverse_iterator<HitIterat> revUpper = linear_lower_bound( revBegin, revEnd, xMax, compXreverse());
        return revUpper.base();
    }
    HitIterat getIterator_Begin(unsigned int lay){
        return std::begin( *(m_hits[lay]) );
    }
    HitIterat getIterator_End(unsigned int lay){
        return std::end( *(m_hits[lay]) );
    }
    bool isEmpty(unsigned int lay) {return getIterator_End(lay) == getIterator_Begin(lay);}
    //ADDED_Rabah
    //=========
    
    void InitializeBB(IterPairs &BB,unsigned int ZoneNumber){
        BB.begin = getIterator_Begin(ZoneNumber);
        BB.end   = getIterator_End(ZoneNumber);
    }
    
    //note: ZoneNum could be obtained from BB,(Prhit.zone()) but ZoneNum contains in addition the (part) information related to the position where this method is called in findXProjection
    
    bool EnoughLayersFired(Boundaries &Bounds,unsigned int minLayers,unsigned int startAt){
        unsigned int nb=startAt;
        for(unsigned int i=startAt;i<NLAYERS;i++){
            nb += (Bounds[i].end-Bounds[i].begin >0 );
        }
        return (nb>=minLayers);
    }
    
protected:
    bool  m_geometryBuilt; ///< Flag to check if geometry was already built
    bool  m_decodedData; //don't decode data twice!
private:
    //THE HITS SAVED HERE
    std::vector< std::unique_ptr<std::vector<PrHit> > >      m_hits;
    //Geometrical infos about different layers, also called zones
    std::vector< std::unique_ptr<PrHitZone> >            m_zones; //does not work lhcb framework??!!
    int              m_maxSize;
    bool             m_eventReady;
};
#endif // PRKERNEL_PRHITMANAGER_H