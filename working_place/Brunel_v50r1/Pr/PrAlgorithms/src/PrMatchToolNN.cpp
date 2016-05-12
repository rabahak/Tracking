// Include files
#include <limits>
#include <vector>
#include <map>
#include <algorithm>

#include <boost/foreach.hpp>

// from Gaudi
#include "Event/StateParameters.h"

#include "TrackInterfaces/IPrAddUTHitsTool.h"

// local
#include "PrMatchToolNN.h"


//-----------------------------------------------------------------------------
// Implementation file for class : PrMatchToolNN
//
// 2013-11-15 : Michel De Cian, moving to upgrade naming and location
// 2008-04-25 : Johannes Albrecht
//-----------------------------------------------------------------------------

// Declaration of the Tool Factory
DECLARE_TOOL_FACTORY(PrMatchToolNN)

//=============================================================================
// Standard constructor, initializes variables
//=============================================================================
PrMatchToolNN::PrMatchToolNN(const std::string& type,
			     const std::string& name, const IInterface* parent) :

GaudiTool(type, name , parent),
  m_addUTHitsTool(0)
{
  declareInterface<IMatchTool>(this);
  declareInterface<ITrackMatch>(this);

  declareProperty("zMagnet"          , m_zMagnet       = 5200. * Gaudi::Units::mm  );
  declareProperty("zMagnetTx2"       , m_zMagnetTx2    =-1700. * Gaudi::Units::mm  );
  declareProperty("zMagnetDsl2"      , m_zMagnetDsl2   =  500. * Gaudi::Units::mm  );
  declareProperty("zMatchY"          , m_zMatchY       = 8420. * Gaudi::Units::mm  );
  declareProperty("dxTol"            , m_dxTol         =    8. * Gaudi::Units::mm  );
  declareProperty("dxTolSlope"       , m_dxTolSlope    =   80. * Gaudi::Units::mm  );
  declareProperty("dyTol"            , m_dyTol         =    6. * Gaudi::Units::mm  );
  declareProperty("dyTolSlope"       , m_dyTolSlope    =  300. * Gaudi::Units::mm  );
  declareProperty("MagnetBend"       , m_magnetBend    =-1000. * Gaudi::Units::mm  );
  declareProperty("MinPt"            , m_minPt         =    0. * Gaudi::Units::MeV );
  declareProperty("MinMomentum"      , m_minMomentum   =    0. * Gaudi::Units::GeV );
  declareProperty("maxMatchChi2"     , m_maxChi2       = 20.                       );
  declareProperty("maxMatchNN"       , m_maxNN         = 0.9                       );
  declareProperty("maxdDist"         , m_maxdDist      = 0.2                       );
  declareProperty("AddUTHits"        , m_addUT              = false                );
  declareProperty("AddUTHitsToolName", m_addUTHitsToolName  = "PrAddUTHitsTool"    );
  declareProperty("writeNNVariables" , m_writeNNVariables   = true                 );
  
}
//=============================================================================
// Destructor
//=============================================================================
PrMatchToolNN::~PrMatchToolNN() {}

//=============================================================================

//=============================================================================
// Initialization
//=============================================================================
StatusCode PrMatchToolNN::initialize()
{

  StatusCode sc = GaudiTool::initialize();

  if (sc.isFailure()) return sc;    // error printed already by GaudiAlgorithm

  if (UNLIKELY(msgLevel(MSG::DEBUG)))
    debug() << "==> Initialize" << endmsg;

  if ( m_addUT) m_addUTHitsTool = tool<IPrAddUTHitsTool>(m_addUTHitsToolName);

  m_geoTool = tool<PrGeometryTool>("PrGeometryTool");

  
  //Input variable names for TMVA
  std::vector<std::string> inputVars;
  inputVars.push_back("chi2");
  inputVars.push_back("distx");
  inputVars.push_back("dslx");
  inputVars.push_back("dsly");
  inputVars.push_back("tolx");
  inputVars.push_back("toly");
  inputVars.push_back("dslope");
  inputVars.push_back("teta2-tseta2");
  m_MLPReader =  new ReadMLPMatching(inputVars);

  //7 variables
  for(unsigned int i=0;i<inputVars.size();i++){
    
    m_MLPReader_input.push_back(0.f);
  }
    
  return StatusCode::SUCCESS;
}

//=============================================================================
StatusCode PrMatchToolNN::matchSingle(const LHCb::Track& velo,
                                     const LHCb::Track& seed , LHCb::Track& output, double& chi2)
{
  // calculate quality of match between tracks
  chi2 = getChi2Match(velo, seed);

  if (m_maxChi2 > chi2) {
    float mlp = 1.-m_MLPReader->GetMvaValue(m_MLPReader_input);
    // set states and flags of output track
    if ( mlp < m_maxNN){
      makeTrack(velo, seed, output, mlp);
      if (m_addUT) m_addUTHitsTool->addUTHits(output);
      return StatusCode::SUCCESS;
    }
  }
  return StatusCode::FAILURE;
}

//=============================================================================
// Main execution
//=============================================================================
StatusCode PrMatchToolNN::match(const LHCb::Tracks& velos,
				const LHCb::Tracks& seeds, LHCb::Tracks& matchs)
{
  // build a match-chi^2 sorted table of velo-seed matches
  std::vector<MatchCandidate> cands;
  cands.reserve(seeds.size());

  BOOST_FOREACH(const LHCb::Track* vTr, velos) {
    cands.clear();
    if (vTr->checkFlag(LHCb::Track::Backward)) continue;
    if (vTr->checkFlag(LHCb::Track::Invalid)) continue;

    BOOST_FOREACH(const LHCb::Track* sTr, seeds) {
      if (sTr->checkFlag(LHCb::Track::Invalid)) continue;
      const double chi2 = getChi2Match(*vTr, *sTr);
      
      float mlp = 99.;
      if(chi2 < m_maxChi2 ){
	mlp= 1. - m_MLPReader->GetMvaValue(m_MLPReader_input);
      }
      if ( mlp < m_maxNN)
	{
	  cands.push_back(MatchCandidate(vTr, sTr, mlp));
	}
    }

    std::stable_sort(cands.begin(), cands.end(), MatchCandidate::lowerByChi2());
    
    int foundSeed=0;
    double bestDist=0;
    // convert unused match candidates to tracks
    BOOST_FOREACH(const MatchCandidate& cand, cands) {

      if(foundSeed == 0) bestDist =cand.dist();
      else if(foundSeed > 5) break;
      else if(cand.dist()-bestDist > m_maxdDist) break;

      const LHCb::Track* vTr = cand.vTr();
      const LHCb::Track* sTr = cand.sTr();

      if (UNLIKELY(msgLevel(MSG::DEBUG)))
	{
	  debug() << " Candidate" 
		  << " Velo " << vTr->key() 
		  << " Seed " << sTr->key() 
		  << " chi2 " << cand.dist() << endmsg;
	}
      
           
      LHCb::Track* match = new LHCb::Track();
      matchs.insert(match);
      
      makeTrack(*vTr, *sTr, *match, cand.dist());
      foundSeed++;

      if (m_addUT) {
	StatusCode sc = m_addUTHitsTool->addUTHits(*match);
	if (sc.isFailure())
	  Warning("adding UT clusters failed!",sc).ignore();
      }
      
      // added for NNTools -- check how many tracks have common hits
      // This is always 1.0 as we require that velo and seed tracks are used only once.
      if (m_writeNNVariables)
	match->addInfo(LHCb::Track::NCandCommonHits, 1.0);
    }//end loop match cands
  }
  return StatusCode::SUCCESS;
}

//=============================================================================
//  Finalize
//=============================================================================
StatusCode PrMatchToolNN::finalize()
{
  if (UNLIKELY(msgLevel(MSG::DEBUG))) debug() << "==> Finalize" << endmsg;


  if(m_MLPReader != nullptr){
    delete m_MLPReader;
    m_MLPReader = nullptr;
  }


  return GaudiTool::finalize();
}

//=============================================================================

double PrMatchToolNN::getChi2Match(const LHCb::Track& velo,
                                  const LHCb::Track& seed) 
{

  double chi2 = std::numeric_limits<double>::max();
  if (velo.checkFlag(LHCb::Track::Invalid)) return chi2;
  if (velo.checkFlag(LHCb::Track::Backward)) return chi2;
  if (seed.checkFlag(LHCb::Track::Invalid)) return chi2;

  const LHCb::State& vState = velo.closestState(0.);
  const LHCb::State& sState = seed.closestState(m_zMatchY);

  //first check momentum
  const double qOverP  = m_geoTool->qOverP( &velo, &seed );
  const double momentum = std::abs(1./qOverP);

  const double tx2 = vState.tx()*vState.tx();
  const double ty2 = vState.ty()*vState.ty();

  const double tsx2 = sState.tx()*sState.tx();
  const double tsy2 = sState.ty()*sState.ty();

  const double sinTrack = sqrt( 1. - 1./(1.+tx2 + ty2) );
  const double pt = sinTrack*momentum;

  if (momentum < m_minMomentum ) return chi2;
  if (pt < m_minPt ) return chi2;
  
  //now other things
  const double dSlope = vState.tx() - sState.tx();
  const double zForX = m_zMagnet
    + m_zMagnetTx2 * vState.tx() * vState.tx()
    + m_zMagnetDsl2 * dSlope * dSlope;
  const double dxTol2 = m_dxTol * m_dxTol;
  const double dxTolSlope2 = m_dxTolSlope * m_dxTolSlope;

  const double xV = vState.x() + (zForX     - vState.z()) * vState.tx();
  const double yV = vState.y() + (m_zMatchY - vState.z()) * vState.ty() +
    vState.ty() * dSlope * dSlope * m_magnetBend;

  const double xS = sState.x() + (zForX     - sState.z()) * sState.tx();
  const double yS = sState.y() + (m_zMatchY - sState.z()) * sState.ty();

  const double distX = xS - xV;
  const double distY = yS - yV;
  const double dslX  = vState.tx() - sState.tx();
  const double tolX = dxTol2 + dslX * dslX *  dxTolSlope2;
  const double teta2 = tx2 + ty2;
  const double tseta2 = tsx2 + tsy2;
  const double tolY  = m_dyTol * m_dyTol + teta2 * m_dyTolSlope * m_dyTolSlope;

  chi2 = distX * distX / tolX + distY * distY /tolY;

  const double dslY = sState.ty() - vState.ty();
  chi2 += dslY * dslY / sState.errTy2() / 16.;
  
  m_MLPReader_input[0] = chi2;
  m_MLPReader_input[1] = distX;
  m_MLPReader_input[2] = dslX;
  m_MLPReader_input[3] = dslY;
  m_MLPReader_input[4] = tolX;
  m_MLPReader_input[5] = tolY;

  m_MLPReader_input[6] = dSlope;  

  m_MLPReader_input[7] = teta2-tseta2;  

  return chi2;
}

//=============================================================================
void PrMatchToolNN::makeTrack(const LHCb::Track& velo,
                             const LHCb::Track& seed, LHCb::Track& output, double chi2) const
{
  //== add ancestors
  output.addToAncestors(velo);
  output.addToAncestors(seed);
  //== Adjust flags
  output.setType(LHCb::Track::Long);
  output.setHistory(LHCb::Track::PrMatch);
  output.setPatRecStatus(LHCb::Track::PatRecIDs);
  output.addInfo(LHCb::Track::MatchChi2, chi2);
  //== copy LHCbIDs
  output.addSortedToLhcbIDs(velo.lhcbIDs());
  output.addSortedToLhcbIDs(seed.lhcbIDs());
  //== copy Velo and T states at the usual pattern reco positions
  std::vector<LHCb::State*> newstates;
  newstates.reserve(6);
  if (velo.hasStateAt(LHCb::State::ClosestToBeam))
    newstates.push_back(velo.stateAt(LHCb::State::ClosestToBeam)->clone());
  if (velo.hasStateAt(LHCb::State::FirstMeasurement))
    newstates.push_back(velo.stateAt(LHCb::State::FirstMeasurement)->clone());
  if (velo.hasStateAt(LHCb::State::EndVelo))
    newstates.push_back(velo.stateAt(LHCb::State::EndVelo)->clone());
  newstates.push_back(seed.closestState(StateParameters::ZBegT).clone());
  newstates.push_back(seed.closestState(StateParameters::ZMidT).clone());
  // make sure we don't include same state twice
  if (std::abs(newstates[newstates.size() - 2]->z() -
               newstates.back()->z()) < 300.) {
    delete newstates.back();
    newstates.pop_back();
  }
  newstates.push_back(seed.closestState(StateParameters::ZEndT).clone());
  // make sure we don't include same state twice
  if (std::abs(newstates[newstates.size() - 2]->z() -
               newstates.back()->z()) < 300.) {
    delete newstates.back();
    newstates.pop_back();
  }
  //== estimate q/p
  double qOverP, sigmaQOverP2;
  qOverP  = m_geoTool->qOverP( &velo, &seed );
  sigmaQOverP2 = 0.1 * 0.1 * qOverP * qOverP;

  BOOST_FOREACH(LHCb::State* st, newstates) {
    st->setCovariance( m_geoTool->covariance( qOverP ) );
    st->setErrQOverP2( sigmaQOverP2 );
    st->setQOverP(qOverP);
    }
    //}
  //== add copied states to output track
  output.addToStates(newstates);
}

//=============================================================================
StatusCode PrMatchToolNN::match(const LHCb::Track& veloTrack,
                               const LHCb::Track& tTrack,
                               LHCb::Track& matchedTrack,
                               double& quality, double& quality2)
{
  quality2=0;
  StatusCode sc = this->matchSingle(veloTrack, tTrack, matchedTrack, quality);
  if (sc.isFailure())
    if (UNLIKELY(msgLevel(MSG::DEBUG))) debug()<<"matching failed !"<<endmsg;

  return sc;
}

// vim: sw=4:tw=78:ft=cpp


