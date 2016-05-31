//
//  boundsManager.hpp
//  
//
//  Created by Rabah  on 31/05/16.
//
//

#ifndef boundsManager_hpp
#define boundsManager_hpp

#include <stdio.h>
#include <PrKernel/PrHit.h>
#include <PrKernel/PrHitZone.h>

class boundsManager {
private:
    std::pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator >* Bounds; //window defined by two iterators
    unsigned int middle_layer1; //indexing middle layers for each case given
    unsigned int middle_layer2;
public:
    //Constructor(numberOfLayers)
    boundsManager(unsigned int);
    
    void scan00(PrHitZone**,unsigned int);
    void scan01(PrHitZone**,unsigned int);
    void scan1(PrHitZone**,unsigned int);
    
    void lookIn(PrHitZone*,unsigned int);
    
    
    std::pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > B_pair(unsigned int);
    
    
    bool firedLayersCHECK();
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#endif /* boundsManager_hpp */
