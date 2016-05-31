void PrHybridSeeding::findXProjections(unsigned int part, unsigned int iCase){
    PrHits parabolaSeedHits; // List of hits in both x-layers in T2
    parabolaSeedHits.reserve(12);
    std::vector<PrHits> xHitsLists; //vector of list of Hits
    xHitsLists.reserve(100);
    PrHits xHits;
    xHits.reserve(6);
    //-----------------------------------------------------Identifying layers [start]--------------------------------------------
    //just do the 1st one here //1st layer and last one
    unsigned int firstZoneId = -1;
    unsigned int lastZoneId = -1;
    std::vector<PrHitZone*> zones;
    zones.reserve(6);
    
    if(0 == iCase){
        firstZoneId = s_T1X1 | part;
        lastZoneId  = s_T3X2 | part;
    }else if ( 1 == iCase ){
        firstZoneId = s_T1X2 | part;
        lastZoneId  = s_T3X1 | part;
    }else if ( 2 == iCase ){
        firstZoneId = s_T1X1 | part;
        lastZoneId  = s_T3X1 | part;
    }else if ( 3 == iCase ){
        firstZoneId = s_T1X2 | part;
        lastZoneId  = s_T3X2 | part;
    }
    if(UNLIKELY(m_debug)){ debug()<<"\t Loading Case Hit in first and last Zone"<<endmsg;}
    zones.pushback(m_zones[firstZoneId]);
    zones.pushback(m_zones[lastZoneId]);
    if(UNLIKELY(m_debug)){ debug()<<"Hits in last and first Zone Loaded"<<endmsg;}
    
    for(unsigned int xZoneId : {s_T1X1, s_T1X2, s_T2X1, s_T2X2, s_T3X1, s_T3X2}){
        xZoneId |= part;
        if(xZoneId != firstZoneId && xZoneId != lastZoneId){
            zones.push_back( m_zones[xZoneId] );
        }
    }
        if(UNLIKELY(m_debug)){
        debug()<<"Hits in the InBetween Zones Loaded"<<endmsg;
        debug()<<"Will Loop over Hits in first Zone"<<endmsg;
        }
    //-----------------------------------------------------Identifying layers [end]--------------------------------------------
    
    //================================================ scan0 method ===============================================
    auto HitF = m_hitManager->getIterator_Begin( firstZoneId);
    auto fHitEnd = m_hitManager->getIterator_End( firstZoneId);
    PrHit* fHit ;
    for( ; HitF!= fHitEnd; ++HitF){
        if(UNLIKELY(m_debug)){ debug()<<"Next Fitst Layer Hit"<<endmsg;}
        fHit = &(*HitF);
        if( fHit->isUsed() && m_removeFlagged) continue;
        ////define search window as a function of the x in the first layer
        //float tx_inf =  (*fHit).x()/zFirst;
        float tx_inf = fHit->x()/zFirst;
        float xProjeInf = tx_inf*zLast;
        float tolHp = m_TolFirstLast[iCase];
        //From Branch ImproveIt we change the alphaCOrrection : case 1 : 1988.63; case 2 : 2354.0
        //For all cases except case = 0
        float maxXl = xProjeInf + tx_inf*m_alphaCorrection[iCase]  +tolHp;
        float minXl = xProjeInf + tx_inf*m_alphaCorrection[iCase]  -tolHp;;
        if(maxXl < minXl){ //should never happen!
            std::swap( minXl, maxXl);
        }
        if(UNLIKELY(m_debug)) debug()<<"iCase "<<iCase<<"\t X last Min \t "<<minXl<<"\n\t\t\t Max X last \t "<<maxXl<<endmsg;
        if(UNLIKELY(m_debug)) debug()<<"Will Loop over Last Layer"<<endmsg;
        //auto itL = std::lower_bound( lHits.begin(), lHits.end(), minXl, lowerBoundX());
        auto HitL = m_hitManager->getIterator_lowerBound( lastZoneId, minXl);
        //auto itLEnd = std::upper_bound( lHits.begin(), lHits.end(), maxXl, upperBoundX());
        auto itLEnd = m_hitManager->getIterator_upperBound( lastZoneId, maxXl);
        PrHit* lHit;
        
        //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ scan0 method ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        
         //================================================ scan1 method ===============================================
        //loop trough hits in last layer
        //if(UNLIKELY(HitL == itLEnd)) continue;
        for( ; HitL!=itLEnd; ++HitL){
            
            lHit = &(*HitL);
            if(UNLIKELY(m_debug)){
                debug()<<"Next Last layer hit"<<endmsg;
                //should never happen in principle
                if(nullptr == lHit){
                    if (m_debug) debug()<<"Not Picking Hits in Last layer in the good search Window"<<endmsg;
                    //break;
                }
            }
            if(lHit->isUsed() && m_removeFlagged) continue;
            float tx_pickedcombination = (lHit->x()-fHit->x())*invDeltaZ;
            parabolaSeedHits.clear();
            float x0 = fHit->x()-tx_pickedcombination*zFirst;
            float CorrX0 = m_x0Corr[iCase]*x0;
            float x0new = x0*(1.+m_x0Corr[iCase]);
            if(UNLIKELY( m_debug )){
                debug() <<" x0 " << x0 << "CorrX0" << CorrX0 << "x0new" << x0new << "slope"<< m_x0Corr[iCase]<< endmsg;
                debug()<<"Will loop over Parabola Seed Hits: n Layers"<<m_zones.size()<<endmsg;
            }
            for(PrHitZone* xZone : {m_zones[s_T2X1 | part], m_zones[s_T2X2 | part]}) {
                float xProjected = x0 + xZone->z()*tx_pickedcombination;
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
                //auto itH = std::lower_bound(xZone->hits().begin(), xZone->hits().end(), xMin, lowerBoundX());
                auto itMBeg = m_hitManager->getIterator_lowerBound( xZone->number(), xMin );
                auto itMEnd = m_hitManager->getIterator_End( xZone->number() );
                if( itMBeg == itMEnd) continue;
                if(m_debug )debug()<<"Will Loop over xZones Hits"<<endmsg;
                //for(; xZone->hits().end() != itH; ++itH){
                
            //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ scan1 method && part of scan1 method^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

                for( ; itMBeg!= itMEnd; ++itMBeg){
                    if( (*itMBeg).x() > xMax ) break;
                    //if( (*mHit).x() > xMax ) break;
                    // we can try to avoid this test
                    if( (*itMBeg).isUsed() && m_removeFlagged) continue; //Not re use Hits in the middle
                    if( m_debug) debug()<<"Filling Parabola Seed Hits"<<endmsg;
                    parabolaSeedHits.push_back( &(*itMBeg) );
                }//Look for another Hit in last layer
                //end loop to pick up Hits in the 2 inner Layers (was only)
            }
            if(parabolaSeedHits.size()==0) continue; //go next last layer hit
            
            //if we don't fine any parabola Seed Hits in the middle 2 Layers then search for another XLast Hit
            // sort the parabola seed hits wrt to distance to the linear projection
            // merged parabolaSeedHits T2-1 & T2-2
            //=======================================================
            // We have 1 Hit in 1st 1 Hit in last and a
            // vector of Hits for in-between
            //=======================================================
            xHitsLists.clear();
            //=======================================================
            //Sort the ParabolaSeedHits for in-between layers in increasing distance from the Projected Corrected position only when we have more than 1 ParabolaSeedHit
            //=======================================================
            if(parabolaSeedHits.size()>1){
                //Principle of the Lambda funtion, Hits sorted wrt distance from linear Projection 1st-3rd layer
                std::sort( parabolaSeedHits.begin(),parabolaSeedHits.end(),
                          [x0new,tx_pickedcombination](const PrHit* lhs, const PrHit* rhs)
                          ->bool{
                              return std::fabs( lhs->x() - ( x0new + lhs->z()*tx_pickedcombination)) < std::fabs( rhs->x() - (x0new + rhs->z()*tx_pickedcombination));} );
            }
            if(UNLIKELY(m_debug)) debug()<<"The Lambda Function Sorting end"<<endmsg;
            unsigned int maxParabolaSeedHits = m_maxParabolaSeedHits;
            if(parabolaSeedHits.size()<m_maxParabolaSeedHits){
                maxParabolaSeedHits = parabolaSeedHits.size();
            }
            if( parabolaSeedHits.size()>m_maxParabolaSeedHits){
                maxParabolaSeedHits = parabolaSeedHits.size();
            }
            for(unsigned int i = 0; i<maxParabolaSeedHits;++i){
                float a = 0;
                float b = 0;
                float c = 0;
                if(UNLIKELY(m_debug)) debug()<<"Clearing xHits"<<endmsg;
                xHits.clear();
                if( m_debug) debug()<<"Hits cleared , will solve parabola "<<endmsg;
                if(UNLIKELY(m_debug)){
                    debug()<<"Parabola Solved Par"
                    <<"\n a \t"<<a
                    <<"\n b \t"<<b
                    <<"\n c \t"<<c<<endmsg;
                    debug()<<"1st Hits in parabola"<<endmsg;
                    printHit(fHit, "First Lay Hit");
                    debug()<<"ParabolaSeed Hit"<<endmsg;
                    printHit(parabolaSeedHits[i]);
                    debug()<<"Last Hit in parabola"<<endmsg;
                    printHit(lHit);
                }
                solveParabola( fHit,parabolaSeedHits[i],lHit,a,b,c); //Extrapolation with dRatio
                if(UNLIKELY(m_debug)){
                    debug()<<"Parabola Solved Par"
                    <<"\n a \t"<<a
                    <<"\n b \t"<<b
                    <<"\n c \t"<<c<<endmsg;
                    debug()<<"1st Hits in parabola"<<endmsg;
                    printHit(fHit, "First Lay Hit");
                    debug()<<"ParabolaSeed Hit"<<endmsg;
                    printHit(parabolaSeedHits[i]);
                    debug()<<"Last Hit in parabola"<<endmsg;
                    printHit(lHit);
                }
                //===================================================
                // Look in all the other layers except the
                // 1st/last/zone except the parabolaSeedHit
                //===================================================
                //Loop on all the xZones
                if(UNLIKELY(m_debug)) debug()<<"Loop on xZones   : size = "<<xZones.size()<<endmsg;
                for(auto xZone :xZones){
                    if (m_debug) debug()<<"Selecting ParSeedHits"<<endmsg;
                    if( (int)xZone->planeCode() == (int)parabolaSeedHits[i]->planeCode()) continue;
                    // float dz   = xZone->z() - m_geoTool->zReference();
                    float dz = xZone->z() - m_zReference;
                    float xAtZ= a * dz * dz * (1. + m_dRatio* dz) + b * dz + c; //with Cubic Correction
                    float xMaxAtZ = xAtZ + m_tolRemaining[iCase];
                    float xMinAtZ = xAtZ - m_tolRemaining[iCase];
                    PrHit* bestProj = nullptr;
                    float  bestDist = 10.0; // 1 cm
                    if (xMinAtZ > xMaxAtZ){
                        if (m_debug) debug()<<"Bad Settings!!!!!!"<<endmsg;
                    }
                    if(UNLIKELY(m_debug)) debug()<<"Get iterator lower bound "<<xMinAtZ<<endmsg;
                    auto itH = m_hitManager->getIterator_lowerBound( xZone->number(), xMinAtZ);
                    //auto itH = std::lower_bound(xZone->hits().begin() ,xZone->hits().end(),xMinAtZ,lowerBoundX());
                    auto itHEnd = m_hitManager->getIterator_End( xZone->number());
                    PrHit* hit;
                    //for (; xZone->hits().end() != itH; ++itH){
                    if(itH == itHEnd) continue;
                    for( ; itH!=itHEnd; ++itH){
                        hit = &*itH;
                        if (hit->isUsed() && m_removeFlagged ) continue;
                        if (hit->x() < xMinAtZ ) continue;
                        if (hit->x() > xMaxAtZ ) break;
                        //Find hit with best distance
                        if(std::fabs(hit->x() - xAtZ)  <  bestDist){
                            bestDist = std::fabs(hit->x() - xAtZ);
                            if(UNLIKELY(m_debug)){
                                debug()<<"I found an Hit from projection"<<endmsg;
                            }
                            bestProj = hit;
                        }
                    }
                    if(bestProj != nullptr){
                        if(UNLIKELY(m_debug)){ debug()<<"Push back best projection in layer  "<< xZone->number()<<endmsg; }
                        xHits.push_back( bestProj);
                    }
                }//end loop xZones
                //in xHits are not present the first layer and last + parabola seed hits
                if(UNLIKELY(m_debug)){
                    debug()<<"End Loop in between zones to pick up Projection of parabola"<<endmsg;
                }
                // xHits.push_back( parabolaSeedHits[i]);
                // Add to the xHits Vector the remaining 3 Hits not considered
                if(xHits.size() < 2 ) continue; //next parabolaSeedHits ; you must find 2 hits
                xHits.push_back(fHit);
                xHits.push_back(parabolaSeedHits[i]);
                xHits.push_back(lHit);
                // if(xHits.size()>6){
                //   always()<<"Smething goes wrong!!!! in the creation of the xHits list"<<endmsg;
                //   always()<<"xHits is bigger than 6 : ERROR"<<endmsg;
                // }
                //end parabola Seed Hits loop in other Layers
                //Still in the L0 loop (selection last layer) :
                // By Construction here:
                //at this step we have 1 Hit in 1st Layer
                //at this step we have 1 Hit in last Layer
                //at this step we have 1 Hit in Middle Layer
                //at this step we have Hit in remaining X layers at the
                //best distance to extrapolated parabola All of them are
                //inside xHits i want to have at least min_HitXSize
                //1st Case keep only 6 Hits on found track
                //2nd Case keep tracks with 4/5/6 hits
                std::sort(xHits.begin(), xHits.end(), compLHCbID());
                bool isEqual = false;
                // Remove xHits in the xHitsLists which are basically the same
                for(PrHits& hits : xHitsLists){
                    if(UNLIKELY(m_debug)) debug()<<"looping on xHitsLists"<<endmsg;
                    if(hits == xHits){
                        isEqual = true;
                        break;
                    }
                }
                if(!isEqual){
                    if (m_debug) debug()<<"Pushing Back xHits List"<<endmsg;
                    xHitsLists.push_back( xHits);
                }
            } //End loop parabolaSeedHits
            if (m_debug) debug()<<"End Loop For pick up Parabola Hits and build the xHitsLists"<<endmsg;
            //End loop Parabola Seed Hits
            //-------- Remove Duplicates from search in parabolaSeedHits
            if(UNLIKELY(m_debug)) debug()<<"xHitsLists size before removing duplicates: "<<xHitsLists.size()<<endmsg;
            if(xHitsLists.size() == 0){
                continue;
            }
            if(xHitsLists.size() > 1){
                //---Remove Duplicates in the HitsList
                if( UNLIKELY(m_debug)){
                    debug()<<"Remove duplicate xHitsLists"<<endmsg;
                }
                std::stable_sort( xHitsLists.begin(), xHitsLists.end());
                xHitsLists.erase( std::unique(xHitsLists.begin(), xHitsLists.end()), xHitsLists.end());
            }
            if(UNLIKELY(m_debug)) debug()<<"xHitsLists size after removing duplicates: "<<xHitsLists.size()<<endmsg;
            //Now let's fit the track
            for(PrHits& xHits : xHitsLists){
                if(UNLIKELY(m_debug)) debug()<<"Fit Track"<<endmsg;
                //Create the track
                PrHybridSeedTrack temp_track( part , m_zReference , xHits);
                //Setters for it: usefull later to parametrise
                temp_track.setdRatio(m_dRatio);
                //-----------------------------------------------------
                //----------------O-_The Fit_-O------------------
                //-----------------------------------------------------
                int nIter = 0;
                if(UNLIKELY(m_debug) ){ 
                    debug()<<"Attempting to Fit the following Track"<<endmsg; printTrack(temp_track);
                }
                bool OK = false;
                if(temp_track.size()>m_minXPlanes){ //no 4 hits at first fit
                    OK = fitXProjection(temp_track,iCase);
                }
                while(!OK && temp_track.size()>m_minXPlanes){
                    if(temp_track.size() <=m_minXPlanes){
                        OK = false;
                        break;
                    }
                    nIter++;
                    if( nIter==1 && temp_track.size() == 5){ OK = false; break;}
                    if( temp_track.size() > m_minXPlanes){
                        OK = removeWorstAndRefitX(temp_track,iCase);
                    }
                }
                if( OK ){
                    setChi2X(temp_track);
                }
                if( OK &&
                   temp_track.size() >= m_minXPlanes &&
                   (( temp_track.chi2PerDoF() < m_maxChi2DoFX[iCase]))){
                    temp_track.setCase( iCase );
                    // useful later in clone killing step
                    temp_track.setXT1(temp_track.x( (m_zones[0]->z() )));
                    temp_track.setXT2(temp_track.x( (m_zones[12]->z())));
                    temp_track.setXT3(temp_track.x( (m_zones[23]->z())));  
                    temp_track.updateIDs();//for bloom filter
                    m_xCandidates[(int)part].push_back(temp_track); //The X Candidate is created
                }
            }//end Loop xHist:xHitsLists
        }//end loop Last Zone given a firsZone selected
    }//end loop first zone
}



