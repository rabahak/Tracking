#ifndef PRFORWARDTOOL_H 
#define PRFORWARDTOOL_H 1

// Include files
// from Gaudi
#include "PrKernel/IPrDebugTool.h"
#include "PrKernel/PrHitManager.h"
#include "PrKernel/PrHit.h"
#include "Event/Track.h"
#include "IPrForwardTool.h"
#include "PrGeometryTool.h"
#include "PrPlaneCounter.h"
#include "PrLineFitter.h"

#include "TrackInterfaces/IPrAddUTHitsTool.h"

//NN for ghostprob
#include "weights/TMVA_MLP.h"

/** @class PrForwardTool PrForwardTool.h
 *  Extend a Velo track to the T stations
 *
 *  @author Olivier Callot
 *  @date   2012-03-20
 *  @author Thomas Nikodem
 *  @date   2016-03-09
 */
class PrForwardTool : public IPrForwardTool {
public: 

  /// Standard constructor
  PrForwardTool( const std::string& type, 
                  const std::string& name,
                  const IInterface* parent);

  virtual ~PrForwardTool( ); ///< Destructor

  virtual StatusCode initialize();
  virtual StatusCode finalize  (); 

  //main method
  void extendTrack( LHCb::Track* velo, LHCb::Tracks* result );

  //make full PrForward Track candidates
  void selectFullCandidates( PrForwardTracks& trackCandidates);

  // work wth with X-hits on x projection
  void collectAllXHits( PrHits& allXHits, PrForwardTrack& track, unsigned int side); //side = top or bottom

  void selectXCandidates( PrForwardTracks& trackCandidates, PrHits& allXHits, PrForwardTrack& track, unsigned int side );

  void fastLinearFit( PrForwardTrack& track );

  bool fitXProjection( PrForwardTrack& track ); //also used in the end for "complete" fit

  bool addHitsOnEmptyXLayers( PrForwardTrack& track, unsigned int side, bool refit = true );


  //work with U/V hits on y projection
  bool collectStereoHits( PrForwardTrack& track );

  bool selectStereoHits( PrForwardTrack& track );

  bool fitYProjection( PrForwardTrack& track, PrHits& stereoHits );

  bool addHitsOnEmptyStereoLayers( PrForwardTrack& track, PrHits& stereoHits );


  //save good tracks
  void makeLHCbTracks( PrForwardTracks& trackCandidates, LHCb::Tracks* result );

protected:

private:

  //Setup variables
  std::string     m_hitManagerName;
  std::string     m_addUTHitsToolName;
  float           m_minPt;
  unsigned int    m_minXHits;
  float           m_tolY;
  float           m_tolYSlope;
  float           m_maxXWindow;
  float           m_maxXWindowSlope;
  float           m_maxXGap;
  unsigned int    m_minSingleHits;
  float           m_maxChi2LinearFit;
  float           m_maxChi2XProjection;
  float           m_maxChi2PerDoF;
  float           m_minYGap;
  float           m_tolYMag;
  float           m_tolYMagSlope;
  unsigned int    m_minTotalHits;
  float           m_maxChi2StereoLinear;
  float           m_maxChi2Stereo;
  float           m_maxQuality;
  float           m_deltaQuality;
  unsigned int    m_nbXPlanes;
  unsigned int    m_minStereoHits;
  float           m_yTol_UVsearch;
  float           m_tolYSlope_collectX;
  float           m_tolY_collectX;
  float           m_tolYTriangleSearch;
  //parameters for second loop
  bool            m_secondLoop;
  unsigned int    m_minXHits_2nd;
  float           m_maxXWindow_2nd;
  float           m_maxXWindowSlope_2nd;
  float           m_maxXGap_2nd;
  //Momentum estimate
  bool  m_useMomentumEstimate;
  bool  m_Preselection;
  float m_PreselectionPT;
  bool  m_useWrongSignWindow;
  float m_wrongSignPT;
  //geometry Params
  std::vector<float> m_zMagnetParams;
  std::vector<float> m_xParams;
  std::vector<float> m_byParams;
  std::vector<float> m_cyParams;
  std::vector<float> m_momentumParams;
  std::vector<float> m_covarianceValues;
  float              m_zReference;

  //layer structure of the FT det
  std::vector<int> m_xZones;
  std::vector<int> m_uvZones;
  std::vector<int> m_triangleZones;

  //current values
  unsigned int    m_minXHits_cur;   // current value for the minimal number of X hits.
  float           m_maxXWindow_cur;
  float           m_maxXWindowSlope_cur;
  float           m_maxXGap_cur;
  bool            m_debug;

  //Tools
  IPrAddUTHitsTool*  m_addUTHitsTool;
  PrHitManager*      m_hitManager;
  PrGeometryTool*    m_geoTool;
  PrPlaneCounter     m_pc;

  PrLineFitter        m_line;
  std::array< std::unique_ptr<PrHits>,12 >m_otherHits;


  //Neural Net
  IClassifierReader* m_MLPReader;
  std::vector<float> m_MLPReader_input;

  /// Parameters of the velo track 
  float m_x0;
  float m_y0;
  float m_z0;
  float m_tx;
  float m_ty;
  float m_qOverP;
  float m_tx2;
  float m_ty2;
  float m_slope2;

  //member memory only allocated once
  // Working values
  PrHits          m_allXHits1;
  PrHits          m_allXHits2;
  PrHits          m_stereoHits;
  PrForwardTracks m_trackCandidates;
  PrForwardTracks m_trackCandidates2ndLoop;
  //mem for merge sort
  unsigned int m_sizeMergeTmp1;
  unsigned int m_sizeMergeTmp2;
  unsigned int m_sizeMergeTmp1_1;
  PrHit** m_MergeTmp1;
  PrHit** m_MergeTmp2;
  PrHit** m_MergeTmp1_1;
  //vector for calculating xAtRef
  float m_xHits[8] __attribute__((__aligned__(32))); //AVX-256: 8 floats at the same time 

  //helper functions
  void merge6Sorted(PrHits& allXHits, std::vector<int> &boundaries);
  float zMagnet();
  float calcqOverP(const PrForwardTrack& track);
  void  setTrackParameters( PrForwardTrack& track, const float xAtRef);
  void  xAtRef_SamePlaneHits(PrHits::iterator itH, PrHits::iterator itEnd);

  //inline helper functions
  /// Predicted x position for a given z, using a straight line from Velo information
  inline float xFromVelo( const float z )  const { return m_x0 + (z-m_z0) * m_tx; }
  /// Predicted y position for a given z, using a straight line from Velo information
  inline float yFromVelo( const float z )  const { return m_y0 + (z-m_z0) * m_ty; }

  //find matching stereo hit if available
  inline bool matchStereoHit(std::vector<PrHit>::const_iterator& itUV1, std::vector<PrHit>::const_iterator& itUV1end, const float xMinUV, const float xMaxUV){
    //search for same side UV hit
    for ( ; itUV1end != itUV1 && (*itUV1).x() < xMaxUV; ++itUV1 ) {
      if( (*itUV1).x() > xMinUV) return true;
    }
    return false;
  }

  //find matching stereo hit if available, also searching in triangle region
  inline bool matchStereoHitWithTriangle(std::vector<PrHit>::const_iterator& itUV1, std::vector<PrHit>::const_iterator& itUV1end, std::vector<PrHit>::const_iterator& itUV2, std::vector<PrHit>::const_iterator& itUV2end, const float yInZone, const float xMinUV, const float xMaxUV, unsigned int side){
    //search for same side UV hit
    for ( ; itUV1end != itUV1 && (*itUV1).x() < xMaxUV; ++itUV1 ) {
      if( (*itUV1).x() > xMinUV) return true;
    }
    //search for opposite side UV hit
    if(side < 1){
      //test lower layer, thus only ymax
      for ( ; itUV2end != itUV2 && (*itUV2).x() < xMaxUV; ++itUV2 ) {
        if(   ((*itUV2).x() > xMinUV) &&   (*itUV2).yMax() > yInZone - m_yTol_UVsearch ){
          return true;
        }
      }
    }else{
      //test upper layer, thus only ymin
      for ( ; itUV2end != itUV2 && (*itUV2).x() < xMaxUV; ++itUV2 ) {
        if(  ((*itUV2).x() > xMinUV) && (*itUV2).yMin() < yInZone + m_yTol_UVsearch  ){
          return true;
        }
      }
    }
    return false;
  }


};
#endif // PRFORWARDTOOL_H
