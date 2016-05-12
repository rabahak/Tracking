#ifndef PRPLANECOUNTER_H
#define PRPLANECOUNTER_H 1

// Include files
#include "PrKernel/PrHit.h"

/** @class PrPlaneCounter PrPlaneCounter.h
 *  Small class to count how many different planes are in a list and how many planes with a single hit fired
 *  
 *  @author Olivier Callot
 *  @date   2012-03-23
 *  @author Michel De Cian
 *  @date   2014-03-12 Added number of planes which only have a single hit
 *  @author Thomas Nikodem
 *  @date   2016-03-04 
 *
 */

class PrPlaneCounter {
public:

  /// Standard constructor
  PrPlaneCounter( )
    : m_nbDifferent( 0 ),
      m_planeList( {{0,0,0,0,0,0,0,0,0,0,0,0}} )
  {
  }
  
  virtual ~PrPlaneCounter( ) {} ///< Destructor


  /** Update values for additional hit
   *  @param hit Hit to be added
   *  @return int number of different planes
   */
  inline void addHitIfUnused( const PrHit* hit ) {
    const unsigned int notUsed = (int)(!hit->isUsed());
    m_nbDifferent += ((int)((m_planeList[hit->planeCode()] += notUsed ) == 1) & notUsed) ;
  }
  inline void addHit(const PrHit* hit ) {
    m_nbDifferent += (int)((m_planeList[hit->planeCode()] += 1 ) == 1) ;
  }

  /** Update values for removed hit
   *  @param hit Hit to be removed
   *  @return int number of different planes
   */
  inline void removeHitIfUnused( const PrHit* hit ) {
    const unsigned int notUsed = (int)(!hit->isUsed());
    m_nbDifferent -= ((int)((m_planeList[hit->planeCode()] -= notUsed ) == 0) & notUsed) ;
  }
  inline void removeHit( const PrHit* hit ) {
    m_nbDifferent -= ((int)((m_planeList[hit->planeCode()] -= 1 ) == 0)) ;
  }

  /** Set values (fired planes, single planes, different planes) for a given range of iterators
   *  @brief Set values for a given range of iterators
   *  @param itBeg First iterator, begin of range
   *  @param itEnd Last iterator, end of range
   */
  void set( PrHits::const_iterator itBeg, PrHits::const_iterator itEnd)  {
    for ( PrHits::const_iterator itH = itBeg; itEnd != itH; ++itH) 
      addHit(*itH);
  }
  void set(const PrHits& hits){
    for(auto hit : hits)
      addHit(hit);
  }
  void setUnused( PrHits::const_iterator itBeg, PrHits::const_iterator itEnd)  {
    for ( PrHits::const_iterator itH = itBeg; itEnd != itH; ++itH)
       addHitIfUnused(*itH);
  }
  void setUnused(const PrHits& hits){
    for(auto hit : hits)
       addHitIfUnused(hit);
  }

  /// returns number of different planes
  inline unsigned int nbDifferent() const { return m_nbDifferent; }

  /// returns number of hits in specified plane
  inline int nbInPlane( const int plane ) const { return m_planeList[plane]; }

  /// returns number of single planes
  //TODO make this smarter?
  unsigned int nbSingle() const { 
    unsigned int nbDouble = 0;
    for(int i=0;i<12;i++)
      nbDouble += (int) (m_planeList[i]>1);

    return m_nbDifferent - nbDouble;
  }
  
  /// clear list with hits in planes and number of different planes / single-hit planes 
  void clear(){
     m_nbDifferent = 0;

     for(int i=0;i<12;i++)
       m_planeList[i]=0; //do NOT alloc new mem
  }
  

private:
  
  /// array for: number of different plane (0) and number of planes with single hit (1) 
  unsigned int m_nbDifferent;
  std::array<int,12> m_planeList;
};

#endif // PRPLANECOUNTER_H
