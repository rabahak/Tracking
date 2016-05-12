#ifndef PRFORWARDTRACK_H 
#define PRFORWARDTRACK_H 1

// Include files
#include "Event/Track.h"
#include "Event/StateParameters.h"
#include "PrKernel/PrHit.h"

/** @class PrForwardTrack PrForwardTrack.h
 *  This is the working class inside the T station pattern
 *
 *  @author Olivier Callot
 *  @date   2012-03-22
 *  @author Thomas Nikodem
 *  @date   2016-01-23
 */
class PrForwardTrack {
public: 
  /// Constructor with only a Velo track
  PrForwardTrack( const LHCb::Track* track, float zRef, float ay, float by ) 
    : m_track( track ),m_valid(true),m_zRef(zRef),m_ax(0.f),m_bx(0.f),m_cx(0.f),m_dx(0.f),m_ay(ay),m_by(by),m_cy(0.f),m_chi2(0.f),m_nDoF(-1),m_quality(0.f),m_qop(0.f)
  {}; 
  
  PrForwardTrack( const PrForwardTrack& track): // copy contructor (should be depricated)
  m_track(track.m_track),m_valid(track.m_valid),m_zRef(track.m_zRef),
  m_ax(track.m_ax),
  m_bx(track.m_bx),
  m_cx(track.m_cx),
  m_dx(track.m_dx),
  m_ay(track.m_ay),
  m_by(track.m_by),
  m_cy(track.m_cy),
  m_chi2(track.m_chi2),
  m_nDoF(track.m_nDoF),
  m_quality(track.m_quality),
  m_qop(track.m_qop)
  {
    m_hits = std::unique_ptr<PrHits>(new PrHits(*(track.m_hits)) ); 
  };

  virtual ~PrForwardTrack( ) { }; ///< Destructor

  PrForwardTrack& operator=(const PrForwardTrack& track){
    if (this != &track) {
      m_track   = track.m_track;
      m_valid   = track.m_valid;
      m_zRef    = track.m_zRef;
      m_ax      = track.m_ax;
      m_bx      = track.m_bx;
      m_cx      = track.m_cx;
      m_dx      = track.m_dx;
      m_ay      = track.m_ay;
      m_by      = track.m_by;
      m_cy      = track.m_cy;
      m_chi2    = track.m_chi2;
      m_nDoF    = track.m_nDoF;
      m_quality =track.m_quality;
      m_qop = track.m_qop;
      m_hits = std::unique_ptr<PrHits>(new PrHits(*(track.m_hits)));
    }
    return *this;
  };


  const LHCb::Track* track()        const { return m_track; }

  void  replaceHits(std::unique_ptr<PrHits>& hits) {
    m_hits = std::move(hits);
  } 

  /// Handling of hits: access, insertion
  PrHits& hits()                   { return *m_hits; }
  const PrHits& hits()       const { return *m_hits; }
  void addHit( PrHit* hit )        { m_hits->push_back( hit );} 
  void addHits( PrHits& hits ) {
    m_hits->insert( m_hits->end(), hits.begin(), hits.end() );
  }
     
  /** Set the parameters of the track. Cubic in x, parabolic in y
   *  @brief  Set the parameters of the track
   *  @param ax constant coefficient for x parametrisation
   *  @param bx linear coefficient for x parametrisation
   *  @param cx quadratic coefficient for x parametrisation
   *  @param dx cubic coefficient for x parametrisation
   *  @param ay constant coefficient for y parametrisation
   *  @param by linear coefficient for y parametrisation
   *  @param cy quadratic coefficient for y parametrisation
   */
  void setParameters( const float ax, const float bx, const float cx, const float dx, 
                      const float ay, const float by, const float cy ) {
    m_ax = ax;
    m_bx = bx;
    m_cx = cx;
    m_dx = dx;
    m_ay = ay;
    m_by = by;
    m_cy = cy;
  }

  void setYParams( const float ay, const float by, const float cy ) {
    m_ay = ay;
    m_by = by;
    m_cy = cy;
  }

  void getYParams(float& ay, float& by, float& cy ){
    ay = m_ay;
    by = m_by;
    cy = m_cy;
  }

  //ay,by,bx params
  void getParametersAyByBx( float& ay, float& by, float& bx) {
    ay = m_ay;
    by = m_by;
    bx = m_bx;
  }

  void getParameters( float& ax, float& bx, float& cx, float& dx, float& ay, float& by, float& cy ) {
    ax = m_ax;
    bx = m_bx;
    cx = m_cx;
    dx = m_dx;
    ay = m_ay;
    by = m_by;
    cy = m_cy;
  }
  
   /** Update the parameters of the track. Cubic in x, parabolic in y
   *  @brief Update the parameters of the track
   *  @param ax constant coefficient for x parametrisation
   *  @param bx linear coefficient for x parametrisation
   *  @param cx quadratic coefficient for x parametrisation
   *  @param dx cubic coefficient for x parametrisation
   *  @param ay constant coefficient for y parametrisation
   *  @param by linear coefficient for y parametrisation
   *  @param cy quadratic coefficient for y parametrisation
   */
  void updateParameters( const float dax, const float dbx, const float dcx) {
    m_ax += dax;
    m_bx += dbx;
    m_cx += dcx;
  }
  void updateParameters( const float dax, const float dbx, const float dcx,
                         const float ddx, const float day, const float dby, const float dcy ) {
    m_ax += dax;
    m_bx += dbx;
    m_cx += dcx;
    m_dx += ddx;
    m_ay += day;
    m_by += dby;
    m_cy += dcy;
  }

  void updateDay(const float day){
    m_ay += day;
  } 
  void updateYParameters(const float day, const float dby ) {
    m_ay += day;
    m_by += dby;
  }
  void updateYParameters(const float day, const float dby, const float dcy ) {
    m_ay += day;
    m_by += dby;
    m_cy += dcy;
  }

  /// Get the x position at a certain z position
  inline float x( const float z )         const { float dz = z-m_zRef; return m_ax + dz*( m_bx + dz*( m_cx + dz*m_dx ) ); }
  /// Get the x slope at a certain z position
  inline float xSlope( const float z )    const { float dz = z-m_zRef; return m_bx + dz*( 2 * m_cx + 3 * dz * m_dx ); }
  /// Get the y position at a certain z position
  inline float y( const float z )         const { float dz = z-m_zRef; return m_ay + dz*( m_by + dz * m_cy); } 
  /// Get the y slope at a certain z position
  inline float ySlope( const float z )    const { float dz = z-m_zRef; return m_by + dz* 2. * m_cy; }  
  /// Get the x position at a certain z position, assuming the track is a straight line
  inline float xStraight( const float z ) const { return m_ax + (z-m_zRef) * m_bx; }
  /// Get the y position at a certain z position, assuming the track is a straight line
  inline float yStraight( const float z ) const { return m_ay + (z-m_zRef) * m_by; }

  /// Calculate the y position of a hit given the parametrised track
  inline float yOnTrack( PrHit* hit ) const { const float sly =  ySlope( hit->z() ); 
    return hit->yOnTrack( y(hit->z()) - sly * hit->z(), sly ); }

  /// Calculate the distance between a hit and the parametrised track
  inline float distance( PrHit* hit ) const { 
    float z_Hit = hit->z(y(hit->z()));
    float x_track = x(z_Hit);
    float y_track = y(z_Hit);
    return hit->distance(x_track, y_track);
  }
  inline float distanceFast( PrHit* hit ) const {
    float z_Hit = hit->z(); //ignore first itteraton!!
    float x_track = x(z_Hit);
    float y_track = y(z_Hit);
    return hit->distance(x_track, y_track); 
  }
  inline float distanceXHit( PrHit* hit ) const { 
    //float z_Hit = hit->z(y(hit->z())); //ignore slope of modules in z direction. effect is small enough to ignore in the beginning
    float x_track = x(hit->z());
    return hit->distanceXHit(x_track);
  }

  /// Calculate the chi2 contribution of a single hit to the parametrised track
  float chi2( PrHit* hit )     const { const float d = distance( hit ); return d * d * hit->w(); }
  float chi2Fast( PrHit* hit ) const { const float d = distanceFast( hit ); return d * d * hit->w(); }
  float chi2XHit( PrHit* hit ) const { const float d = distanceXHit( hit ); return d * d * hit->w(); }


  bool valid()                               const { return m_valid; }
  void setValid( const bool v )                    { m_valid = v; }

  void  setChi2( const float chi2, const int nDoF ) { m_chi2 = chi2; m_nDoF = nDoF; }
  float chi2()                               const { return m_chi2; }
  float chi2PerDoF()                         const { return m_chi2 / (float) m_nDoF; }
  int   nDoF()                               const { return m_nDoF; }
  void  setQuality( const float q )               { m_quality = q; }
  float quality()                           const { return m_quality; }

  void  setQoP(const float qop)                   { m_qop = qop;}
  float getQoP()                            const { return m_qop;}

  void  setHitsUnused() {
    for ( PrHit* hit : (*m_hits) ) hit->setUnUsed();
  }

  struct LowerByQuality {
    bool operator() (const PrForwardTrack& lhs, const PrForwardTrack& rhs ) const { return lhs.quality() < rhs.quality(); }
  };

protected:

private:

  const LHCb::Track* m_track;
  std::unique_ptr<PrHits> m_hits;
  bool   m_valid;

  float  m_zRef;  //TODO do it better
  
  float m_ax;
  float m_bx;
  float m_cx;
  float m_dx;
  float m_ay;
  float m_by;
  float m_cy;

  //Track quality parameters
  float m_chi2;
  int   m_nDoF;
  float m_quality;

  // Charge(q) of particle divided by momentum (p) of particle 
  float m_qop;
};

typedef std::vector<PrForwardTrack> PrForwardTracks;

#endif // PRFORWARDTRACK_H
