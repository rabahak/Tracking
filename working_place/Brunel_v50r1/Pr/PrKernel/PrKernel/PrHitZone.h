// $Id: $
#ifndef PRKERNEL_PRHITZONE_H 
#define PRKERNEL_PRHITZONE_H 1

// Include files
#include "PrKernel/PrHit.h"
#include "Kernel/DetectorSegment.h"

/** @class PrHitZone PrHitZone.h PrKernel/PrHitZone.h
 *  Store the information of a zone in the T stations
 *  A zone is a part of a layer with boundaries, so that all hits are measuring
 *  one coordinate in this zone. 
 *  For FT, this is the top or bottom parts of each layer.
 *  The zone has a number, a plane code, slopes (dxDy, dzDy) and boundaries
 *
 *  @author Olivier Callot
 *  @date   2012-03-13
 */
class PrHitZone {
public: 
  /// Standard constructor
  PrHitZone( unsigned int number ) {
    m_number    = number;
    m_planeCode = number/2;  // two zones per plane
    m_z         =  1.e9;
    m_xMin      = -1.e9;
    m_xMax      =  1.e9;
    m_yMin      = -1.e9;
    m_yMax      =  1.e9;
  }

  virtual ~PrHitZone( ) {}; ///< Destructor

  void setGeometry( DetectorSegment& seg ) { 
    m_z      = seg.z( 0. );
    m_dxDy   = ( seg.x(100.) - seg.x(0.) ) / 100.;
    m_dzDy   = ( seg.z(100.) - seg.z(0.) ) / 100.;
    m_isX    = fabs( m_dxDy ) < 0.010;
  }; 

  unsigned int number()     const { return m_number;    }
  unsigned int planeCode()  const { return m_planeCode; }
  float z( float y = 0.)          { return m_z + m_dzDy * y; }
  float dxDy()              const { return m_dxDy; }
  float dzDy()              const { return m_dzDy; }
  bool isX()                const { return m_isX; }

  /// Set the size of the surrounding box
  void setBoundaries( float xMin, float xMax, float yMin, float yMax ) {
    m_xMin = xMin;
    m_xMax = xMax;
    m_yMin = yMin;
    m_yMax = yMax;
  }

  /// Is the point in the surrounding box?
  inline bool isInside( float x, float y ) {
    return y < m_yMax && y > m_yMin && x > m_xMin && x < m_xMax;
  }

  inline bool isInsideY( float y ) {
    return y < m_yMax && y > m_yMin;
  }

  float dxOnAFibre() { return ( m_yMax - m_yMin ) * m_dxDy; }

protected:

private:
  unsigned int  m_number;
  unsigned int  m_planeCode;
  float         m_z;
  float         m_dxDy;
  float         m_dzDy;
  bool          m_isX;
  float         m_xMin;
  float         m_xMax;
  float         m_yMin;
  float         m_yMax;
};
typedef std::vector<PrHitZone*> PrHitZones;
#endif // PRKERNEL_PRHITZONE_H
