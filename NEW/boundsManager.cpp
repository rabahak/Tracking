//
//  boundsManager.cpp
//  
//
//  Created by Rabah  on 31/05/16.
//
//

#include "boundsManager.hpp"

boundsManager::boundsManager(unsigned int numberOfLayers){
    Bounds=new std::pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator >[numberOfLayers];
    for(i=0;i<6;i++)
        loop_bool[i]=1;
        
}

void boundsManager::scan00(PrHitZone** zones, unsigned int iCase)
{
        
    float xProjected=(*(Bounds[0].first)).x();
    float tx=xProjected/(zones[0]->z());
    
    for(int i=1;i<6;i++)
    {
    xProjected = tx*(zones[i]->z()) //ATTENTION ASK Renato : which class contains the Constants? m_tolFirst...
        maxProjected =
        minProjected =
    Max=xProjected + tx*m_alphaCorrection[iCase]  + m_TolFirstLast[iCase]
    Min=xProjected + tx*m_alphaCorrection[iCase]  - m_TolFirstLast[iCase]

    Bounds[i].first  = m_hitManager->getIterator_lowerBound( zones[i]->number(), Min);
    Bounds[i].second = m_hitManager->getIterator_upperBound( zones[i]->number(), Max);
    }
}

void boundsManager::scan01(PrHitZone** zones, unsigned int iCase)
{/*
    
    float xProjected=(*(Bounds[0].first)).x();
    float tx=xProjected/(zones[0]->z());
  
    for(int i=1;i<6;i++)
    {
    xProjected = tx*(zones[i]->z()) //ATTENTION ASK Renato : which class contains the Constants? m_tolFirst...
    Max=xProjected + tx*m_alphaCorrection[iCase]  + m_TolFirstLast[iCase]
    Min=xProjected + tx*m_alphaCorrection[iCase]  - m_TolFirstLast[iCase]
  
    //Bounds[i].first  = m_hitManager->getIterator_lowerBound( zones[i]->number(), Min);
    //Bounds[i].second = m_hitManager->getIterator_upperBound( zones[i]->number(), Max);
*/
}

void boundsManager::scan1(PrHitZone** zones,unsigned int iCase)
{
    //for( ; HitL!=itLEnd; ++HitL){
        
        /*if(UNLIKELY(m_debug)){
            debug()<<"Next Last layer hit"<<endmsg;
            //should never happen in principle
            if(nullptr == current_hit1){
                if (m_debug) debug()<<"Not Picking Hits in Last layer in the good search Window"<<endmsg;
                //break;
            }
        }*/
    
        //if(Bounds[1].first->isUsed() && m_removeFlagged) continue; //HERE YOU SHOULD THINK ABOUT THE IDEA OF DEVISING FALGGING OPERATION IN 2 (CENTRAL ZONE - AND NON-CENTRAL)
        float invDeltaZ = 1./(zones[1]->z()-zones[0]->z());
        float tx_pickedcombination = (Bounds[1].first->x()-Bounds[0].first->x())*invDeltaZ;
        parabolaSeedHits.clear();
        float x0 = Bounds[0].first->x()-tx_pickedcombination*zones[0]->z();
        float CorrX0 = m_x0Corr[iCase]*x0;
        float x0new = x0*(1.+m_x0Corr[iCase]);
        if(UNLIKELY( m_debug )){
            debug() <<" x0 " << x0 << "CorrX0" << CorrX0 << "x0new" << x0new << "slope"<< m_x0Corr[iCase]<< endmsg;
            debug()<<"Will loop over Parabola Seed Hits: n Layers"<<m_zones.size()<<endmsg;
        }
    
    
    for(int i=2;i<6;i++)
    {
            float xProjected = x0 + zones[i]->z()*tx_pickedcombination; //ATTENTION all bounds here are squeezed in respec of the 3 hit line not the 2 hit line!!!
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
        
        
        
        
            //auto itMBeg = m_hitManager->getIterator_lowerBound( xZone->number(), xMin );
            //auto itMEnd = m_hitManager->getIterator_End( xZone->number() );
        //-----------------------------------------------------------WORK PLACE------------------------------------------------------------------
        //Tag: Rabah    Originally from version1 committed
        


            if(xMin>Bounds[i].first->x())
            {
                //ATTENTION make this as a method in PrKernel
               Bounds[i].first = std::lower_bound( Bounds[i].first, getIterator_End(zones->number()), xMin , [](const PrHit& a, const float testval) -> bool { return a.x() < testval;});
                
               Bounds[i].second = std::upper_bound( Bounds[i].second, getIterator_End(zone->number()), xMax ,[](const float testval, const PrHit& a) -> bool { return a.x() > testval ; });

                /*
                while((*itMBeg).x()<xMin) //because xMin is dependant on x0, (not constante as before in Lbound)
                {if(itMBeg==m_hitManager->getIterator_End( xZone->number())) break;
                    else itMBeg++;}*/
            }
            else
            {
                if(xMin!=Bounds[i].first->x()) // excluded the case where the bound is not changed from previous
                {
                    //upperBound because we're in REVERSE !!!!!
                    
                    Bounds[i].first = std::upper_bound( Bounds[i].first, getIterator_Begin(zones->number()), xMin , [](const float testval, const PrHit& a) -> bool { return a.x() > testval ; });
                    Bounds[i].second = std::lower_bound( Bounds[i].second, getIterator_Begin(zone->number()), xMax , [](const PrHit& a, const float testval) -> bool { return a.x() < testval;});
                    /*
                    while((*itMBeg).x()>xMin)
                    {if(itMBeg==m_hitManager->getIterator_Begin( xZone->number())) break;
                        else itMBeg--;}
                    itMBeg++;
                     */
                    
                }
            }
        
        //Bounds[i].second=m_hitManager->getIterator_End( zones->number());
            //itMEnd=m_hitManager->getIterator_End( xZone->number());//tolerances for xMin/xMax for hits in T2 are small (maximum 10 /15 mm), it’s useless to do the upper bound call
        
            //if( Bounds[i].first == Bounds[i].second) continue;
            if(m_debug )debug()<<"Will Loop over xZones Hits"<<endmsg;
    
    }
    
    void boundsManager::scan2(PrHitZone* middle_zone,unsigned int iCase)
    {
        
        
    }

bool boundsManager::firedLayersCHECK()
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




std::pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > boundsManager::B_pair(unsigned int zone_index)
{
    return Bounds[zone_index]; //zone index: 0-->first, 1-->last, 2-3-4-5---> remaining
    
}

