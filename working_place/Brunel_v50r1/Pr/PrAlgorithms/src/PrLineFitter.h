#ifndef PRLINEFITTER_H 
#define PRLINEFITTER_H 1

// Include files
#include "PrKernel/PrHit.h"

/** @class PrLineFitter PrLineFitter.h
 *  Simple class to fit a line with coordinates
 *
 *  @author Olivier Callot
 *  @date   2012-08-03
 */
class PrLineFitter {
public: 
  /// Standard constructor
  PrLineFitter() {
    m_z0  = 0.f; 
    m_s0  = 0.f;
    m_sz  = 0.f;
    m_sz2 = 0.f;
    m_sc  = 0.f;
    m_scz = 0.f;
    m_c0 = 0.f;
    m_tc = 0.f;
  };
  
  virtual ~PrLineFitter( ){}; ///< Destructor

  void reset(float z, PrHits* hits){
    m_z0  = z; 
    m_s0  = 0.f;
    m_sz  = 0.f;
    m_sz2 = 0.f;
    m_sc  = 0.f;
    m_scz = 0.f;
    m_c0 = 0.f;
    m_tc = 0.f;
    m_hits = hits;
  }

  void set( PrHit* h1=NULL, PrHit* h2=NULL ) {
    m_s0  = 0.f;
    m_sz  = 0.f;
    m_sz2 = 0.f;
    m_sc  = 0.f;
    m_scz = 0.f;
    if ( NULL != h1 ) {
      addHitInternal( h1 );
      if ( NULL != h2 ) {
        addHitInternal( h2 );
        solve();
      }
    }
  }

  void addHit( PrHit* hit ) {
    addHitInternal( hit );
  }

  inline float distance( PrHit* hit ) { return hit->coord() - (m_c0 + (hit->z()-m_z0) * m_tc); }
  
  inline float chi2( PrHit* hit ) {
    float d = distance( hit );
    return d * d * hit->w();
  }

  float coordAtRef() const { return m_c0; }
  float slope()      const { return m_tc; }

  void solve() {
    float den = (m_sz*m_sz-m_s0*m_sz2);
    m_c0  = (m_scz * m_sz - m_sc * m_sz2) / den;
    m_tc  = (m_sc *  m_sz - m_s0 * m_scz) / den;
  }

protected:

  void addHitInternal( PrHit* hit ) {
    m_hits->push_back( hit );
    float c = hit->coord();
    float w = hit->w();
    float z = hit->z() - m_z0;
    m_s0   += w;
    m_sz   += w * z;
    m_sz2  += w * z * z;
    m_sc   += w * c;
    m_scz  += w * c * z;
  }
  

private:
  float   m_z0;
  PrHits* m_hits;
  float   m_c0;
  float   m_tc;

  float m_s0;
  float m_sz;
  float m_sz2;
  float m_sc;
  float m_scz;
  
};
#endif // PRLINEFITTER_H
