//
//  boundsManager.cpp
//  
//
//  Created by Rabah  on 31/05/16.
//
//

//ATTENTION CHECK WITH RENATO WHICH LIBRARY TO BE USED
#include "boundsManager.hpp"
#include "tolerancesConstantes.hpp"
#define NLAYERS 6
#include <stdio.h>
#include <PrKernel/PrHit.h>
#include <PrKernel/PrHitZone.h>
#include <vector>
#include <algorithm>
#include "PrKernel/PrHitManager.h"
#include "GaudiKernel/AlgFactory.h"
#include "Event/Track.h"
#include "Event/StateParameters.h"
#include "Math/CholeskyDecomp.h"


float tx(float x0,float z0,float x1, float z1)
{
    return (x1-x0)/(z1-z0);
}

float get0_x2(float x1, float z1, float z2)
{
    return tx(0,0,x1,z1)*z2;
}
float get_x2(float x0,float z0, float x1, float z1, float z2 )
{
    return tx(x0,z0,x1,z1)*z2;
}
//==================================================READY - NOT VERIFIED===================================================================================
void initialiseTolerances_tri(unsigned int summitLayer, unsigned int TriBaseLayer, std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &Bounds,PrHitZone** zones,unsigned int iCase)
{
    //for a given hit in first layer (i=0) : the summit of the triangle of tolerances
    x0=Bounds[summitLayer].first->x();
    z0=zones[summitLayer]->z();
    
    //for the window chosen : the first triangle base computed (according to it, all bounds will be projected)
    MaxLast=get0_x2(x0,z0,zones[TriBaseLayer]->z())+tx(0,0,x0,z0)*m_alphaCorrection[iCase]+m_TolFirstLast[iCase];
    MinLast=get0_x2(x0,z0,zones[TriBaseLayer]->z())+tx(0,0,x0,z0)*m_alphaCorrection[iCase]-m_TolFirstLast[iCase];
    Bounds[TriBaseLayer].first  = m_hitManager->getIterator_lowerBound( zones[TriBaseLayer]->number(), MinLast);
    Bounds[TriBaseLayer].second = m_hitManager->getIterator_upperBound( zones[TriBaseLayer]->number(), MaxLast);
    
    //project the window of the accordingToIndex layer to the remaining layers (creating a 2D-cone of tolerance with fhit->x() as origin )
    for(int i=1;i<6 && i!=TriBaseLayer;i++)
    {
        Max=get_x2(x0,z0,MaxLast,zones[TriBaseLayer]->z(),zones[i]->z());
        Min=get_x2(x0,z0,MinLast,zones[TriBaseLayer]->z(),zones[i]->z());

    Bounds[i].first  = m_hitManager->getIterator_lowerBound( zones[i]->number(), Min);
    Bounds[i].second = m_hitManager->getIterator_upperBound( zones[i]->number(), Max);
    }
}

//==================================================READY - NOT VERIFIED===================================================================================
void setTolerances_tri(unsigned int summitLayer, unsigned int TriBaseLayer, std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &Bounds,PrHitZone** zones,unsigned int iCase)
{
    //Implement a lowerbound method in PrKernel
    //for a given hit in first layer (i=0)
    x0=Bounds[summitLayer].first->x();
    z0=zones[summitLayer]->z();
    
    //for the window in accordingToIndex layer
    MaxLast=get0_x2(x0,z0,zones[TriBaseLayer]->z())+tx(0,0,x0,z0)*m_alphaCorrection[iCase]+m_TolFirstLast[iCase];
    MinLast=get0_x2(x0,z0,zones[TriBaseLayer]->z())+tx(0,0,x0,z0)*m_alphaCorrection[iCase]-m_TolFirstLast[iCase];
    
    //or simply:
    /*
     MaxLast=get0_x2(x0,z0,zones[TriBaseLayer]->z()+m_alphaCorrection)+m_TolFirstLast;
     MinLast=get0_x2(x0,z0,zones[TriBaseLayer]->z()+m_alphaCorrection)-m_TolFirstLast;
     */
     
    
    Bounds[TriBaseLayer].first  = m_hitManager->getUP_lowerBound( zones[TriBaseLayer]->number(),Bounds[TriBaseLayer].first, MinLast);
    Bounds[TriBaseLayer].second = m_hitManager->getUP_upperBound( zones[TriBaseLayer]->number(),Bounds[TriBaseLayer].second, MaxLast);
    
    //project the window of the last layer to the remaining layers (creating a 2D-cone of tolerance with fhit->x() as origin )
    for(int i=2;i<6 && i!=TriBaseLayer;i++)
    {
        Max=get_x2(x0,z0,MaxLast,zones[TriBaseLayer]->z(),zones[i]->z());
        Min=get_x2(x0,z0,MinLast,zones[TriBaseLayer]->z(),zones[i]->z());
    
        Bounds[i].first  = m_hitManager->getUP_lowerBound( zones[i]->number(),Bounds[i].first, Min);
        Bounds[i].second = m_hitManager->getUP_upperBound( zones[i]->number(),Bounds[i].second, Max);
    }

    
}

//==================================================READY - NOT VERIFIED===================================================================================
//Hit1 and Hit2 define the 2-hit line combination
void setTolerances_par(unsigned int Hit1LayerIndex, unsigned int Hit2LayerIndex,std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &Bounds,PrHitZone** zones, float tolup,float toldown)
{
    float x1=Bounds[Hit1LayerIndex].first->x();
    float z1=zones[Hit1LayerIndex]->z();
    float x2=Bounds[Hit2LayerIndex].first->x();
    float z2=zones[Hit2LayerIndex]->z();
    
    float refLine_tx=tx(x1, z1, x2, z2);
    float x0=x1-refLine*z1;
    
    //x=refLine_tx*z +x0
  
    for(int i=1;i<6;i++)
    {
        Max=refLine_tx*zones[i]->z() +tolup +x0;
        Max=refLine_tx*zones[i]->z() -tolup +x0;
        
        //Squeezing the window //ATTENTION: YOU MAY FIND A CASE WHERE THE BOUNDS DEFINED BY THE TRIANGLE ARE LOWER!! THAN BOUNDS DEFINED BY REC
        //IN THAT CASE YOU CAN FIRST TRY TO PUT THE SUMMIT OF THE TRIANGLE AT Z=0,X=0
        //SECOND PUT A IF() HERE TO CHECK IF THE BOUND IS LOWER OR HIGHER (TRY TO AVOID THIS)
        Bounds[i].first  = m_hitManager->getUP_lowerBound( zones[i]->number(),Bounds[i].first, Min);
        Bounds[i].second = m_hitManager->getDOWN_upperBound( zones[i]->number(),Bounds[i].second, Max);
        
        
    }
}



//NOTE : TO TEST THESE METHODS FOR THE FIRST TIME, IMPLEMENT THEM ONE BY ONE AND WATCH FOR EFFICIENCIES



void fillAndSort_parabolaSeedHits(PrHits &parabolaSeedHits,unsigned int &maxParabolaSeedHits,std::vector<PrHits> &xHitsLists, std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > &Bounds,PrHitZone** zones, unsigned int iCase,bool &continue_index,bool m_removeFlagged )
{
    if(Bounds[1]->isUsed() && m_removeFlagged) {continue_index=1;return;} //ATTENTION CHECK IT !!
    float tx_pickedcombination = tx(Bounds[0].first->x(),zones[0]->z(),Bounds[1].first->x(),zones[1]->z());
    float x0 = Bounds[0].first->x()- tx_pickedcombination*zones[0]->z();
    float CorrX0 = m_x0Corr[iCase]*x0;
    float x0new = x0*(1.+m_x0Corr[iCase]);
    for(int i=2;i<4;i++) //i=2 and 3 ... only middle layers
    {
     
            float xProjected = x0 + zones[i]->z()*tx_pickedcombination;
            float xProjectedCorrected = xProjected+CorrX0;
            float xMax =0.;
            float xMin =0.;
            float max = 0.;
            float min = 0.;
            float slope = (m_tolAtX0Cut[iCase]-m_TolX0SameSign[iCase])/(m_x0Cut[iCase]-m_x0SlopeChange[iCase]);
            float slopeopp = (m_tolAtx0CutOppSig[iCase] -m_tolX0Oppsig[iCase])/(m_x0Cut[iCase]-m_x0SlopeChange2[iCase]);
            if(x0>0.){
                max = m_TolX0SameSign[iCase];
                min = x0 > m_x0SlopeChange[iCase]?  -slope*( x0 - m_x0SlopeChange[iCase]) - m_TolX0SameSign[iCase] : -m_TolX0SameSign[iCase];
                xMin = xProjectedCorrected + min;
                max = x0 > m_x0SlopeChange2[iCase]? slopeopp*( x0 - m_x0SlopeChange2[iCase]) + m_tolX0Oppsig[iCase] : +m_tolX0Oppsig[iCase];
                xMax = xProjectedCorrected + max;
            }else{
                max = x0 < - m_x0SlopeChange[iCase]? -slope*( x0 + m_x0SlopeChange[iCase]) + m_TolX0SameSign[iCase]: m_TolX0SameSign[iCase];
                min = x0 < - m_x0SlopeChange2[iCase]? slopeopp*( x0 + m_x0SlopeChange2[iCase]) - m_tolX0Oppsig[iCase]: -m_tolX0Oppsig[iCase] ;
                xMin = xProjectedCorrected + min;
                xMax = xProjectedCorrected + max;
            }
            if(xMin > xMax) always()<<"Error xMin xMax"<<endmsg;
            if( xMax<xMin && m_debug) debug()<<"\t\t\t\t\t Wrong xMax/xMin"<<endmsg;
            if( m_debug) debug()<<"Lower bound the zones"<<endmsg;
        


            if(xMin>Bounds[i].first->x())
            {
                Bounds[i].first = getUP_lowerBound(zones[i]->number(),Bounds[i].first,xMin);
                //Bounds[i].second = getUP_upperBound(zones->number(),Bounds[i].first,xMax);;

            }
            else
            {
                if(xMin!=Bounds[i].first->x()) // excluded the case where the bound is not changed from previous
                {
                    Bounds[i].first = getDOWN_lowerBound(zones[i]->number(),Bounds[i].first,xMin);
                    //Bounds[i].second = getDOWN_upperBound(zones->number(),Bounds[i].first,xMax);;
                }
            }
    
            Bounds[i].second=m_hitManager->getIterator_End( zones[i]->number());//tolerances for xMin/xMax for hits in T2 are small (maximum 10 /15 mm), it’s useless to do the upper bound call
        
        if( Bounds[i].first == Bounds[i].second) continue;
        if(m_debug )debug()<<"Will Loop over xZones Hits"<<endmsg;
    
        for( ; Bounds[i].first!= Bounds[i].second; Bounds[i].first++){
            if( (*itMBeg).isUsed() && m_removeFlagged) continue; //dont re use Hits in the middle
            if( m_debug) debug()<<"Filling Parabola Seed Hits"<<endmsg;
            parabolaSeedHits.push_back( &(*Bounds[i].first) );
        }
    }
    if(parabolaSeedHits.size()==0) {continue_index=1;return;} //ATTENTION CHECK IT
    xHitsLists.clear();
    if(parabolaSeedHits.size()>1){
        //Principle of the Lambda funtion, Hits sorted wrt distance from linear Projection 1st-3rd layer
        std::sort( parabolaSeedHits.begin(),parabolaSeedHits.end(),
                  [x0new,tx_pickedcombination](const PrHit* lhs, const PrHit* rhs)
                  ->bool{
                      return std::fabs( lhs->x() - ( x0new + lhs->z()*tx_pickedcombination)) < std::fabs( rhs->x() - (x0new + rhs->z()*tx_pickedcombination));} );
    }
    if(UNLIKELY(m_debug)) debug()<<"The Lambda Function Sorting end"<<endmsg;
    maxParabolaSeedHits = m_maxParabolaSeedHits;
    if(parabolaSeedHits.size()<m_maxParabolaSeedHits){
        maxParabolaSeedHits = parabolaSeedHits.size();
    }
    if( parabolaSeedHits.size()>m_maxParabolaSeedHits){
        maxParabolaSeedHits = parabolaSeedHits.size();
    }

}



//==================================================READY - NOT VERIFIED===================================================================================
bool EnoughLayersFired(std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > Bounds)
{
    unsigned int nb=1;
    for(int i=1;i<6;i++)
        if(Bounds[i].second-Bounds[i].first !=0) //found hits
            nb++;
    if(nb>=5)
        return true;
    else
        return false;
}



