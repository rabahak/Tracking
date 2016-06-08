#ifndef PRFTHITMANAGER_H 
#define PRFTHITMANAGER_H 1

// Include files
// from Gaudi
#include "PrKernel/PrHitManager.h"
#include "FTDet/DeFTDetector.h"
#include "GaudiKernel/RndmGenerators.h"

//ADDED_Rabah
#include <utility> //contains pair<,>
#ifndef NLAYERS
#define NLAYERS 6
#endif

//typedef std::vector<PrHit> PrHits; //already defined in PrHitZone.h
typedef PrHits::iterator HitIter;
typedef std::pair< HitIter, HitIter >  IterPairs;
typedef std::array< IterPairs, NLAYERS > Boundaries;



static const InterfaceID IID_PrFTHitManager ( "PrFTHitManager", 1, 0 );

/** @class PrFTHitManager PrFTHitManager.h
 *  Tool that transforms clusters into 'hits' (spatial positions) which are then used by the pattern
 *  recognition algorithms involving the FT.
 *  
 *  Parameters:
 *  - XSmearing: Amount of gaussian smearing in x
 *  - ZSmearing: Switch on displacement in z (not used at the moment)
 *
 *  @author Olivier Callot
 *  @date   2012-03-13
 */
class PrFTHitManager : public PrHitManager {
public: 

  // Return the interface ID
  static const InterfaceID& interfaceID() { return IID_PrFTHitManager; }

  /// Standard constructor
  PrFTHitManager( const std::string& type, 
                   const std::string& name,
                   const IInterface* parent);

  virtual ~PrFTHitManager( ); ///< Destructor

  /** @brief Setup geometry of FT with hit zones for top / bottom / x-u-v-x layers
   */
  void buildGeometry();
  
  /** @brief Construct the hits and apply smearing to hit position (if enabled)
   */
  void decodeData();
    
    //ADDED_Rabah (the 4 following methods_nothing else in here)
    
    void InitializeBB(IterPairs&); //initialises in each xZone, a pair of Prhit iterators
    void PrFTHitManager::UpdateB1B2(IterPairs&,float,float);
    void PrFTHitManager::UpdateB1(IterPairs&,float,float)
    bool EnoughLayersFired(Boundaries&);

  

protected:

private:
  DeFTDetector* m_ftDet;
  Rndm::Numbers m_gauss; ///< Random number generator for gaussian smearing
  float m_xSmearing;  ///< Amount of smearing in x
  float m_zSmearing;
    

};
#endif // PRFTHITMANAGER_H
