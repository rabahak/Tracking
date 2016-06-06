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


void initialiseTolerances_tri(unsigned int, unsigned int, std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &,PrHitZone**,unsigned int);


void setTolerances_tri(unsigned int, unsigned int, std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &,PrHitZone** ,unsigned int);

void setTolerances_par(unsigned int , unsigned int ,std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &,PrHitZone**, float ,float );

void fillAndSort_parabolaSeedHits(PrHits &,unsigned int &,std::vector<PrHits> &xHitsLists, std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &,PrHitZone** , unsigned int ,bool &,bool);

bool EnoughLayersFired(std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS >);