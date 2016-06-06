
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
    std::array<PrHitZone*,6> zones;
    
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
    zones[0]=m_zones[firstZoneId];
    zones[1]=m_zones[lastZoneId];
    if(UNLIKELY(m_debug)){ debug()<<"Hits in last and first Zone Loaded"<<endmsg;}
    zones[2]=m_zones[s_T2X1|part];
    zones[3]=m_zones[s_T2X2|part];
    int i=4;
    for(unsigned int xZoneId : {s_T1X1, s_T1X2, s_T3X1, s_T3X2}){
        xZoneId |= part;
        if(xZoneId != firstZoneId && xZoneId != lastZoneId){
            zones[i]=m_zones[xZoneId];
            i++;
        }
    }
    if(UNLIKELY(m_debug)){
        debug()<<"Hits in the InBetween Zones Loaded"<<endmsg;
        debug()<<"Will Loop over Hits in first Zone"<<endmsg;
        
    }
std::array<pair< std::vector<PrHit>::iterator , std::vector<PrHit>::iterator > , NLAYERS > Bounds;
bool continue_index=0;
bool oneTime_layer0=1;bool oneTime_others=1;
//one time initialisation:

if(oneTime_layer0) //or do{} while(once);  ?
{
Bounds[0].first = m_hitManager->getIterator_Begin(zones[0]->number());
Bounds[0].second= m_hitManager->getIterator_End(zones[0]->number());
oneTime_layer0=0;
}
//===FIRST LAYER LOOP===
for(; Bounds[0].first != Bounds[0].second; Bounds[0]++) //for a hit in first layer
{
    if(oneTime_others){
        initialiseTolerances_tri(0,1,Bounds , zones , iCase); //set triangle(2D Cone) of tolerances according to first =0 and last layer =1
        oneTime_others=0;}
    else {
        setTolerances_tri(0,1,Bounds , zones , iCase); //set triangle of tolerances according to first =0 and last layer =1
         }

    if(EnoughLayersFired==false)
    continue;
    
    //===SECOND LAYER LOOP===
    for(; Bounds[1].first != Bounds[1].second; Bounds[1]++) //for a hit in last layer
    {        //                  1 refers to a dynamic bound (hit) here (in its corresponding loop)
        setTolerances_par(0,1,Bounds , zones , 10,10); //set parallelogram of tolernaces according to first layer hit and last layer hit (2Dtube of axe : 2 hit-combination)
        if(EnoughLayersFired==false)
        continue;
        
        unsigned int maxParabolaSeedHits;
        fillAndSort_parabolaSeedHits(parabolaSeedHits,maxParabolaSeedHits,xHitsLists,Bounds,zones,iCase,continue_index,m_removeFlagged)
        if(continue_index){continue_index=0;continue;}
        
        //=====================TO COMPRESS
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
                printHit(&(*Bounds[0].first), "First Lay Hit");
                debug()<<"ParabolaSeed Hit"<<endmsg;
                printHit(parabolaSeedHits[i]);
                debug()<<"Last Hit in parabola"<<endmsg;
                printHit(&(*Bounds[1].first));
                }
                solveParabola( &(*Bounds[0].first),parabolaSeedHits[i],&(*Bounds[1].first),a,b,c); //Extrapolation with dRatio
                if(UNLIKELY(m_debug)){
                    debug()<<"Parabola Solved Par"
                    <<"\n a \t"<<a
                    <<"\n b \t"<<b
                    <<"\n c \t"<<c<<endmsg;
                    debug()<<"1st Hits in parabola"<<endmsg;
                    printHit(&(*Bounds[0].first), "First Lay Hit");
                    debug()<<"ParabolaSeed Hit"<<endmsg;
                    printHit(parabolaSeedHits[i]);
                    debug()<<"Last Hit in parabola"<<endmsg;
                    printHit(&(*Bounds[1].first));
                }
                //===================================================
                // Look in all the other layers except the
                // 1st/last/zone except the parabolaSeedHit
                //===================================================
                //Loop on all the zones[i]
                if(UNLIKELY(m_debug)) debug()<<"Loop on xZones   : size = "<<zones[i].size()<<endmsg;
                for(int i=2;i<6;i++){
                    if (m_debug) debug()<<"Selecting ParSeedHits"<<endmsg;
                    if( (int)zones[i]->planeCode() == (int)parabolaSeedHits[i]->planeCode()) continue;
                    // float dz   = xZone->z() - m_geoTool->zReference();
                    float dz = zones[i]->z() - m_zReference;
                    float xAtZ= a * dz * dz * (1. + m_dRatio* dz) + b * dz + c; //with Cubic Correction
                    float xMaxAtZ = xAtZ + m_tolRemaining[iCase];
                    float xMinAtZ = xAtZ - m_tolRemaining[iCase];
                    PrHit* bestProj = nullptr;
                    float  bestDist = 10.0; // 1 cm
                    if (xMinAtZ > xMaxAtZ){
                        if (m_debug) debug()<<"Bad Settings!!!!!!"<<endmsg;
                    }
                    if(UNLIKELY(m_debug)) debug()<<"Get iterator lower bound "<<xMinAtZ<<endmsg;
                    //auto itH = m_hitManager->getIterator_lowerBound( zones[i]->number(), xMinAtZ);
                    //auto itH = std::lower_bound(xZone->hits().begin() ,xZone->hits().end(),xMinAtZ,lowerBoundX());
                    //auto itHEnd = m_hitManager->getIterator_End( xZone->number());
                    
                    if(xMinAtZ>Bounds[i].first->x())
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
                    Bounds[i].second=m_hitManager->getIterator_End( zones[i]->number());
                    PrHit* hit;
                    //for (; xZone->hits().end() != itH; ++itH){
                    if(Bounds[i].first == Bounds[i].second) continue;
                    for( ; Bounds[i].first!=Bounds[i].second; ++Bounds[i].first){
                        hit = &(*Bounds[i].first);
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
                        if(UNLIKELY(m_debug)){ debug()<<"Push back best projection in layer  "<< zones[i]->number()<<endmsg; }
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
                xHits.push_back(&(*Bounds[0].first));
                xHits.push_back(parabolaSeedHits[i]);
                xHits.push_back(&(*Bounds[1].first));
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

    

