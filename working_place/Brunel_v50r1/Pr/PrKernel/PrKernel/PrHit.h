// $Id: $
#ifndef PRKERNEL_PRHIT_H 
#define PRKERNEL_PRHIT_H 1

// Include files
#include "Kernel/LHCbID.h"

/** @class PrHit PrHit.h PrKernel/PrHit.h
 *  Hits to be used in the pattern in the T/TT stations
 *
 *  @author Olivier Callot
 *  @date   2012-03-13
 *  @author Thomas Nikodem
 *  @date   2016-04-11
 */
class PrHit {
public: 
  /// Standard constructor
  PrHit( ){}; 

  virtual ~PrHit( ) {}; ///< Destructor

  void setHit( const LHCb::LHCbID id,
               const float x0,
               const float z0,
               const float dxDy,
               const float dzDy,
               const float yMin,
               const float yMax,
               const float errX,
               const int zone,
               const int planeCode
  ){
    m_id         = id;
    m_werr       = 1.f/errX;
    m_w          = m_werr*m_werr;
    m_coord      = x0;
    //Detector segment
    m_x0   = x0; ///< x coordinate at y = 0
    m_z0   = z0; ///< z coordinate at y = 0
    m_dxDy = dxDy; ///< Slope x vs y, typically 0 for x layers
    m_dzDy = dzDy; ///< Slope z vs y, as detectors are vertical while Z axis is not horizontal
    m_yMin = yMin;
    m_yMax = yMax;
    //0-5 -> planeCode 
    m_info = uint(planeCode) & uint(31);//0b011111;//31;
    //7 -> detector side
    if(zone > 0){
      m_info = m_info | uint(64);//0b01000000;  //= unsigned 64
    }
    //isX ->8
    if(fabs( x(1.f)-x(0.f) ) < 0.001f){
      //isX
      m_info = m_info | uint(128);
    }
    //isUsed -> 9
    //isUsedInTrack ->10
  }
  
  inline LHCb::LHCbID id()     const { return m_id;     }

  inline float x() const { return m_x0; }
  inline float x( float y ) const { return m_x0 + y * m_dxDy; }
  inline float z() const { return m_z0; }
  inline float z( float y ) const { return m_z0 + y * m_dzDy; }
  inline float werr()          const { return m_werr ;}
  inline float w()             const { return m_w; }
  inline float yMin()          const { return m_yMin;   }
  inline float yMax()          const { return m_yMax;   }
  inline float coord()         const { return m_coord; }
  inline float yOnTrack( float y0, float dyDz ) { return ( y0 + dyDz * m_z0 ) / ( 1. - dyDz * m_dzDy ); } //PrHybridSeedTrack.h:144
  inline float dxDy()          const { return m_dxDy; }  //used for deltaY
  inline float dzDy()          const { return m_dzDy; }

  inline float distance( const float x_track, const float y_track) const{ return x( y_track ) -  x_track; }
  inline float distanceXHit( const float x_track) const{return m_x0 - x_track;}

  inline int   planeCode()     const { return  m_info &  uint(31); }
  inline int   zone()          const { return (m_info &  uint(64))>>6; } //only needed in printHit...
  inline bool  isX()           const { return (m_info &  uint(128)) > 0; }
  inline bool  isUsed()        const { return (m_info &  uint(256)) > 0; }
  inline bool  isUsedInTrack() const { return (m_info &  uint(512)) > 0; }
  void setUnUsed()                   { m_info = m_info & uint(65279); } //1111111011111111
  void setUsed()                     { m_info = m_info | uint(256); }
  void setUnUsedInTrack()            { m_info = m_info & uint(65023); } //1111110111111111
  void setUsedInTrack()              { m_info = m_info | uint(512); }

  void setCoord( float c )   { m_coord = c; }

  struct LowerByX0 {
    bool operator() (const PrHit& lhs, const PrHit& rhs ) const { return lhs.m_x0 < rhs.m_x0; } 
  };

  struct LowerByCoord {
    bool operator() (const PrHit* lhs, const PrHit* rhs ) const { return lhs->coord() < rhs->coord(); }
  };
  struct LowerByZ {
    bool operator() (const PrHit* lhs, const PrHit* rhs ) const { return lhs->z() < rhs->z(); }
  };
  
protected:

private:
  //sort according to access
  float m_x0;    /// x coordinate at y = 0
  uint  m_info;  /// several infos are stored in this variable, for definition look at code above
  float m_yMin;  /// minimum y coordinate along this segment
  float m_yMax;  /// maximum y coordinate along this segment
  float m_coord; /// for X-hits: value at reference plane. for U/V hits: dy
  float m_w;     /// 1/error^2 of hit
  float m_werr;  /// Add for line fitter vectorised

//Detector segment
  float m_z0;    ///  z coordinate at y = 0
  float m_dxDy;  ///  Slope x vs y, typically 0 for x layers
  float m_dzDy;  ///  Slope z vs y, as detectors are vertical while Z axis is not horizontal

  LHCb::LHCbID m_id;

};

typedef std::vector<PrHit*> PrHits;

#endif // PRKERNEL_PRHIT_H
