from Gaudi.Configuration import importOptions
from Gaudi.Configuration import *
from Configurables import Brunel
from Gaudi.Configuration import *

##########################
name = "Ciao"
 
Brunel().EvtMax      = 10  #Number of events to run -1 to run on all
Brunel().PrintFreq   = 1    #Execution frequency print out
Brunel().SkipEvents  = 0    #Want to skip a given event?
Brunel().OutputType  = "NONE"  #to disable dst output
NTupleSvc().Output   = ["FILE1 DATAFILE='test.root' TYP='ROOT' OPT='NEW'"] #If from some MCTool you need to produce a nTuple or in the algorithms you will produce a file called test.root
HistogramPersistencySvc().OutputFile = "Histos.root"
from Configurables import DigiConf
DigiConf().EnableUnpack = True 
Brunel().WithMC     = True
Brunel().Simulation = True

VeloUT_mode = True             #to use VeloUT tracks as input for Forward, instead of Velo only ones

##########################

#I select only the tracking stations
from Configurables import CondDB, LHCbApp, DDDBConf
CondDB().Upgrade = True
CondDB().LoadCALIBDB = 'HLT1'
LHCbApp().DDDBtag = "dddb-20160304" #tags database
LHCbApp().CondDBtag = "sim-20150716-vc-md100" #tags database
Brunel().Detectors = ['VP', 'UT', 'FT', 'Magnet'] #Detectors to load ( 'VP' = velo pixel , 'UT' = upstream tracker , 'FT' = scifi, 'Magnet' = magnet' )
Brunel().DataType     = "Upgrade"

#choose the track types you want to reconstruct
from Configurables import TrackSys
#TrackSys().TrackTypes= ["Velo","Upstream","Forward","Seeding","Match","Downstream"] #Run ALL algorithms ( Downstream tracking depending on configuration needs the Forward and Matching (not sure about upstream ?)

#TrackSys().TrackTypes= ["Velo","Upstream","Forward","Seeding","Match"] #Run ALL algorithms excluding the Downstream
TrackSys().TrackTypes = ["Velo","Forward","Seeding"]#,"Downstream"] #Run Only Seeding and Downstream ( needs to set Seeding.DecodeData = True) 
Brunel().RecoSequence = ["Decoding","Tr" ]  #Allow to decode and run tracking

#disable trigger
from Configurables import RecMoniConf
RecMoniConf().MoniSequence = []
from Configurables import L0Conf
L0Conf().EnsureKnownTCK=False

#input file
#/exp/LHCb/abdulkhalek
Brunel().InputType  = "DIGI"
from Gaudi.Configuration import *
from GaudiConf import IOHelper
IOHelper('ROOT').inputFiles([
        '/exp/LHCb/abdulkhalek/InputFiles/4288_0_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_1_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_2_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_3_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_4_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_5_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_6_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_7_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_8_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_9_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_10_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_11_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_12_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_13_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_14_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_15_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_16_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_17_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_18_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_19_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_20_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi',
        '/exp/LHCb/abdulkhalek/InputFiles/4288_21_UFT5x_13104012_Noise_LightSharing_NewDeposit_RectangleSinglePowerAttMap_-Extended.digi'
        ], clear=True) #to be able to run these files you have to ask for the access to eos/ wg/SciFi ( mailTo Alessio Piucci )


###################### Custom Reconstruction sequence

def setMCTruth() :
    from Configurables import PrLHCbID2MCParticle, PrTrackAssociator, VPClusterLinker
    GaudiSequencer("RecoTrSeq").Members = []
    GaudiSequencer("CheckPatSeq").Members = []
    GaudiSequencer("MCLinksUnpackSeq").Members = [ ]
    GaudiSequencer("MCLinksTrSeq").Members = []
    GaudiSequencer("MCLinksTrSeq").Members = ["VPClusterLinker","PrLHCbID2MCParticle","PrTrackAssociator"]
    #setting the Checking sequence                                                                                                                                                                       
    from Configurables import PrChecker
    #PrChecker configuration ( Pr/PrMCTools/PrChecker.cpp ) (it produces the efficiencies and the plots (Eta25Cut : performance only for tracks in 2<eta<5, by default it also excludes electrons from pe\rformance numbers                                                                                                                                                                                    
    GaudiSequencer("MCLinksTrSeq").Members+= [ PrChecker("PrChecker", 
                                                         #WriteForwardHistos = 2, 
                                                         WriteTTrackHistos = 2,
                                                         Eta25Cut = True) ]
def setupSeeding() :
    seedingSeq = GaudiSequencer("TrSeedingSeq")
    GaudiSequencer("RecoTrSeq").Members += [ seedingSeq ]
    from Configurables import PrHybridSeeding
    #PrHybridSeeding("PrHybridSeeding").InputName = "Rec/Track/Forward" #Seeding From Forward                                                                                                        
    PrHybridSeeding("PrHybridSeeding",
                    InputName = "",
                    DecodeData = False, #Set to True if you don't want to run Forward in the sequence                                                                              
                    OutputLevel =3,
                    Recover = True,
                    TimingMeasurement = True,
                    PrintSettings = True) #produce some clones ( higher +2% ghost rate )                                                                                                 
                    
    seedingSeq.Members += [PrHybridSeeding()]
    
def CustomRecoSeq() :
    
    ### Up to here checker 
    #############################################################################################################################################################################
    #setting the Reco Sequence
    trackTypes = TrackSys().getProp("TrackTypes")
    #Velo tracking ( you don't really care about it , but are needed for Matching and Forward Tracking
    setMCTruth()
    if "Velo" in trackTypes:
        from Configurables import PrPixelTracking, PrPixelStoreClusters
        GaudiSequencer("TrVeloSeq").Members = []
        GaudiSequencer("TrVeloSeq").Members += [PrPixelTracking(),PrPixelStoreClusters()]
        veloSeq = GaudiSequencer("TrVeloSeq")
        GaudiSequencer("RecoTrSeq").Members += [ veloSeq ]

    if "Upstream" in trackTypes:
        from Configurables import PrVeloUT
        GaudiSequencer("TrUpSeq").Members = []
        GaudiSequencer("TrUpSeq").Members += [ PrVeloUT() ]
        upSeq = GaudiSequencer("TrUpSeq")
        GaudiSequencer("RecoTrSeq").Members += [ upSeq ]
        if VeloUT_mode :
            #setting the upstream reco sequence
            prVeloUT = PrVeloUT()
            from Configurables import TrackMasterFitter
            prVeloUT.addTool(TrackMasterFitter,"Fitter")
            prVeloUT.Fitter.MeasProvider.IgnoreVelo = True
            prVeloUT.Fitter.MeasProvider.IgnoreVP = True
            prVeloUT.Fitter.MeasProvider.IgnoreTT = True
            prVeloUT.Fitter.MeasProvider.IgnoreIT = True
            prVeloUT.Fitter.MeasProvider.IgnoreOT = True
            prVeloUT.Fitter.MeasProvider.IgnoreUT = False
            prVeloUT.Fitter.MeasProvider.IgnoreVP = False
            #setting the forward reco sequence to use VELOUT tracks
            from Configurables import PrForwardTracking,PrForwardTool
            PrForwardTracking("PrForwardTracking").InputName = "Rec/Track/VeloTT"
            PrForwardTracking("PrForwardTracking").addTool( PrForwardTool("PrForwardTool"))
            PrForwardTracking("PrForwardTracking").PrForwardTool.UseMomentumEstimate = True
    
    if "Forward" in trackTypes:
        forwardSeq = GaudiSequencer("TrForwardSeq")
        GaudiSequencer("RecoTrSeq").Members += [ forwardSeq ]

    #Seeding configurations , InputName = "" = seeding standalone
    if "Seeding" in trackTypes:
        setupSeeding()

    if "Match" in trackTypes:
        matchSeq = GaudiSequencer("TrMatchSeq")
        matchSeq.Members = []
        GaudiSequencer("RecoTrSeq").Members += [ matchSeq ]
        from Configurables import PrMatchNN
        matchSeq.Members += [ PrMatchNN() ]

    #Important for downstream tracking ( if you need Forward Location and MatchLocation you should activate also tracking for them )
    if "Downstream" in trackTypes:
        downSeq = GaudiSequencer("TrDownSeq")
        GaudiSequencer("RecoTrSeq").Members += [ downSeq ]
        from Configurables import PrDownstream
        # I tried to add all the configurables for Downstream tracking, whatever new configurables can be changed here and add it in the private section of PrDownstream.h + in declareProperty
        # If you don't specify it here, it will pick up the default one
        downStreamTracking = PrDownstream(
            PrintTracks = False,
            TimingMeasurement = False,
            deltaP = 2.0,
            xPredTol = 150.,
            xPredTol2 = 20.,
            TolMatch = 1.5,
            TolUV = 2.0,
            TolMomentum = 20000.,
            maxWindowSize = 10.0,
            MaxDistance = 0.30,
            MaxChisq = 20.,
            DeltaChisq = 3.5,
            errorZMagnet = 30.,
            minUTx = 35.,
            minUTy = 35,
            yParams = [5., 2000.],
            zUT = 2485.,
            zUTa = 2350.,
            StateErrorX2 = 4.0,
            StateErrorY2 = 400.,
            StateErrorTX2 = 6.e-5,
            StateErrorTY2 = 1.e-4,
            StateErrorP = 0.15,
            MinPt = 0.,
            MinMomentum = 0.,
            RemoveUsed = False,
            RemoveAll = False, #if true, everything is removed ( remove hits and T-tracks used for long tracks )
            LongChi2 = 1.5,
            Mode = True, #true = original downstream trakcing , false = new approach to downstream tracking
            RemoveHits = True,
            TracksToKeep = 3, #Number of tracks per seed to keep if mode == true
            WithDebugTool = False #PrDebugUTTool will run, not properly implemented indeed ( should be adapted )
            )
        downSeq.Members += [ downStreamTracking ]
    
        
    if "Best" in trackTypes: #kalman filter
        bestSeq = GaudiSequencer("TrBestSeq")
        
        from Configurables import TrackBestTrackCreator, TrackMasterFitter
        from TrackFitter.ConfiguredFitters import ConfiguredMasterFitter
        
        tracklists = []
        
        if "Velo" in trackTypes:
            tracklists += ["Rec/Track/Velo"]
            
        if "Upstream" in trackTypes:
            tracklists += ["Rec/Track/VeloTT"]
                
        if "Forward" in trackTypes:
            tracklists += ["Rec/Track/Forward"]
                    
        if "Seeding" in trackTypes:
            tracklists += ["Rec/Track/Seed"]
                    
        bestTrackCreator = TrackBestTrackCreator( TracksInContainers = tracklists )
        bestTrackCreator.addTool( TrackMasterFitter, name="Fitter")
        bestTrackCreator.FitTracks = True
        bestTrackCreator.InitTrackStates = False
        
        ConfiguredMasterFitter( bestTrackCreator.Fitter )
        
        bestSeq.Members += [ bestTrackCreator ]
        GaudiSequencer("RecoTrSeq").Members += [ bestSeq ]
        
        ### ghost probability using a Neural Net
        #from Configurables import TrackAddNNGhostId, TrackNNGhostId
        #ghostID = TrackAddNNGhostId()
        #ghostID.GhostIdTool = "UpgradeGhostId"
        #GaudiSequencer("TrackAddExtraInfoSeq").Members += [ ghostID ]
        #addExtraInfoSeq = GaudiSequencer("TrackAddExtraInfoSeq")
        #GaudiSequencer("RecoTrSeq").Members += [ addExtraInfoSeq ]

#########################
appendPostConfigAction( CustomRecoSeq ) #Do it

