
#include "boundsManager.hpp"

boundsManager Ra;
static bool oneTime=1; //ATTENTION To verify ! and to put them as PRIVATE in PrHybridSeeding.h (by defining those bools as static, they should also contribute in saving time)
static bool oneTime0=1;
//one time initialisation:
if(oneTime)
{
Bounds[0].first  = m_hitManager->getIterator_Begin(zones[0]->number());
Bounds[0].second = m_hitManager->getIterator_End(zones[0]->number());
oneTime=0;
}
//===FIRST LAYER LOOP===
for(; Bounds[0].first != Bounds[0].second; Bounds[0]++) //scan in first layer
{
    //both scan00 and scan01 takes Bounds[0].first as origin and sets all bounds in all layers by projecting the last layer tolerance everywhere
    //scan00: used only one time via old method of scaning : getIterator_lower/upperbound (time draining method)
    //scan01: used after it, by moving iterators from previous positions
    if(oneTime0){
        Ra.scan00(zones,iCase);
        oneTime0=0;}
    else {
        Ra.scan01(zones,iCase);
        
    }

    if(firedLayersCHECK==false)
    continue;
    
    //===SECOND LAYER LOOP===
    for(; Bounds[1].first != Bounds[1].second; Bounds[1]++) //scan in last layer
    {
        Ra.scan1(zones,iCase); // will scan in the last layer for hits, and will adjust for each one find, the proper bounds in others
        //Window is squeezed :
        if(firedLayersCHECK==false)
        continue;
        
        //===THIRD LAYER LOOP===
        for(PrHitZone* xZone : {m_zones[s_T2X1 | part], m_zones[s_T2X2 | part]})
        {
            Ra.lookIn(xZone,iCase);
        
        }
        //notes: to work 1) on how to recognize the middle layers 
        
    }
    
    
}
