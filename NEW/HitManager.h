// In PrHitManager.h ... in PrKernel folder

//ADDDING TO THESE 2 METHODS:
/*
 std::vector<PrHit>::iterator getIterator_lowerBound(unsigned int lay, float xMin){
 // is there gain by a lookup table? dont think so but maybe we can test..
 //search
 return std::lower_bound( getIterator_Begin(lay), getIterator_End(lay), xMin ,
 [](const PrHit& a, const float testval) -> bool { return a.x() < testval;} );
 }
 
 std::vector<PrHit>::iterator getIterator_upperBound(unsigned int lay, float xMax){
 return std::upper_bound( getIterator_Begin(lay), getIterator_End(lay), xMax ,
 [](const float testval, const PrHit& a) -> bool { return a.x() > testval ; });
 }
*/


//THE FOLLOWING NEW METHODS:

std::vector<PrHit>::iterator getUP_lowerBound(unsigned int lay,std::vector<PrHit>::iterator given_it, float xMin){
    return std::lower_bound( given_it, getIterator_End(lay), xMin ,
                            [](const PrHit& a, const float testval) -> bool { return a.x() < testval;} );
}

std::vector<PrHit>::iterator getUP_upperBound(unsigned int lay,std::vector<PrHit>::iterator given_it, float xMax){
    return std::upper_bound( given_it , getIterator_End(lay), xMax ,
                            [](const float testval, const PrHit& a) -> bool { return a.x() > testval ; });
}

std::vector<PrHit>::iterator getDOWN_lowerBound(unsigned int lay,std::vector<PrHit>::iterator given_it, float xMin){
    while(given_it!=getIterator_End(lay))
    {
        if((*given_it).x()<xMin)
            break;
        else
            given_it--;
    }
    given_it++;
    return given_it;
}

std::vector<PrHit>::iterator getDOWN_upperBound(unsigned int lay,std::vector<PrHit>::iterator given_it, float xMax){
    
    while(given_it!=getIterator_End(lay))
    {
        if((*given_it).x()<xMax)
            break;
        else
            given_it--;
    }
    given_it++;
    return given_it;
        
}