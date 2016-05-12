#Wed May 11 14:31:12 2016"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.GaudiHandles import *
from GaudiKernel.Proxy.Configurable import *

class TrackEventFitter( ConfigurableAlgorithm ) :
  __slots__ = { 
    'OutputLevel' : 0, # int
    'Enable' : True, # bool
    'ErrorMax' : 1, # int
    'ErrorCounter' : 0, # int
    'ExtraInputs' : [], # list
    'ExtraOutputs' : [], # list
    'AuditAlgorithms' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditReinitialize' : False, # bool
    'AuditRestart' : False, # bool
    'AuditExecute' : False, # bool
    'AuditFinalize' : False, # bool
    'AuditBeginRun' : False, # bool
    'AuditEndRun' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'Timeline' : True, # bool
    'MonitorService' : 'MonitorSvc', # str
    'RegisterForContextService' : True, # bool
    'IsClonable' : False, # bool
    'Cardinality' : 1, # int
    'NeededResources' : [  ], # list
    'ErrorsPrint' : True, # bool
    'PropertiesPrint' : False, # bool
    'StatPrint' : True, # bool
    'TypePrint' : True, # bool
    'Context' : '', # str
    'RootInTES' : '', # str
    'StatTableHeader' : ' |    Counter                                      |     #     |    sum     | mean/eff^* | rms/err^*  |     min     |     max     |', # str
    'RegularRowFormat' : ' | %|-48.48s|%|50t||%|10d| |%|11.7g| |%|#11.5g| |%|#11.5g| |%|#12.5g| |%|#12.5g| |', # str
    'EfficiencyRowFormat' : ' |*%|-48.48s|%|50t||%|10d| |%|11.5g| |(%|#9.6g| +- %|-#9.6g|)%%|   -------   |   -------   |', # str
    'UseEfficiencyRowFormat' : True, # bool
    'CounterList' : [ '.*' ], # list
    'StatEntityList' : [  ], # list
    'VetoObjects' : [  ], # list
    'RequireObjects' : [  ], # list
    'TracksInContainer' : 'Rec/Track/Best', # str
    'TracksOutContainer' : '', # str
    'Fitter' : PrivateToolHandle('TrackMasterFitter/Fitter'), # GaudiHandle
    'SkipFailedFitAtInput' : True, # bool
    'MaxChi2DoF' : 999999.00, # float
  }
  _propertyDocDct = { 
    'RequireObjects' : """ Execute only if one or more of these TES objects exists """,
    'VetoObjects' : """ Skip execute if one or more of these TES objects exists """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'StatPrint' : """ Print the table of counters """,
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'Cardinality' : """ How many clones to create """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(TrackEventFitter, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrackFitter'
  def getType( self ):
      return 'TrackEventFitter'
  pass # class TrackEventFitter

class TrackKalmanFilter( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'ExtraInputs' : [], # list
    'ExtraOutputs' : [], # list
    'ErrorsPrint' : True, # bool
    'PropertiesPrint' : False, # bool
    'StatPrint' : True, # bool
    'TypePrint' : True, # bool
    'Context' : '', # str
    'RootInTES' : '', # str
    'StatTableHeader' : ' |    Counter                                      |     #     |    sum     | mean/eff^* | rms/err^*  |     min     |     max     |', # str
    'RegularRowFormat' : ' | %|-48.48s|%|50t||%|10d| |%|11.7g| |%|#11.5g| |%|#11.5g| |%|#12.5g| |%|#12.5g| |', # str
    'EfficiencyRowFormat' : ' |*%|-48.48s|%|50t||%|10d| |%|11.5g| |(%|#9.6g| +- %|-#9.6g|)%%|   -------   |   -------   |', # str
    'UseEfficiencyRowFormat' : True, # bool
    'CounterList' : [ '.*' ], # list
    'StatEntityList' : [  ], # list
    'ContextService' : 'AlgContextSvc', # str
    'ForceBiDirectionalFit' : True, # bool
    'ForceSmooth' : False, # bool
    'DoF' : 5, # int
  }
  _propertyDocDct = { 
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'ContextService' : """ The name of Algorithm Context Service """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'StatPrint' : """ Print the table of counters """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(TrackKalmanFilter, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrackFitter'
  def getType( self ):
      return 'TrackKalmanFilter'
  pass # class TrackKalmanFilter

class TrackMasterFitter( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'ExtraInputs' : [], # list
    'ExtraOutputs' : [], # list
    'ErrorsPrint' : True, # bool
    'PropertiesPrint' : False, # bool
    'StatPrint' : True, # bool
    'TypePrint' : True, # bool
    'Context' : '', # str
    'RootInTES' : '', # str
    'StatTableHeader' : ' |    Counter                                      |     #     |    sum     | mean/eff^* | rms/err^*  |     min     |     max     |', # str
    'RegularRowFormat' : ' | %|-48.48s|%|50t||%|10d| |%|11.7g| |%|#11.5g| |%|#11.5g| |%|#12.5g| |%|#12.5g| |', # str
    'EfficiencyRowFormat' : ' |*%|-48.48s|%|50t||%|10d| |%|11.5g| |(%|#9.6g| +- %|-#9.6g|)%%|   -------   |   -------   |', # str
    'UseEfficiencyRowFormat' : True, # bool
    'CounterList' : [ '.*' ], # list
    'StatEntityList' : [  ], # list
    'ContextService' : 'AlgContextSvc', # str
    'Projector' : PrivateToolHandle('TrackProjectorSelector'), # GaudiHandle
    'MeasProvider' : PrivateToolHandle('MeasurementProvider'), # GaudiHandle
    'NodeFitter' : PrivateToolHandle('TrackKalmanFilter'), # GaudiHandle
    'Extrapolator' : PrivateToolHandle('TrackMasterExtrapolator'), # GaudiHandle
    'VeloExtrapolator' : PrivateToolHandle('TrackLinearExtrapolator'), # GaudiHandle
    'FitUpstream' : True, # bool
    'NumberFitIterations' : 10, # int
    'Chi2Outliers' : 9.0000000, # float
    'MaxNumberOutliers' : 2, # int
    'StateAtBeamLine' : True, # bool
    'AddDefaultReferenceNodes' : True, # bool
    'UseSeedStateErrors' : False, # bool
    'ErrorX' : 20.000000, # float
    'ErrorY' : 20.000000, # float
    'ErrorTx' : 0.10000000, # float
    'ErrorTy' : 0.10000000, # float
    'ErrorQoP' : [ 0.00000000 , 0.01000000 ], # list
    'MakeNodes' : False, # bool
    'MakeMeasurements' : False, # bool
    'MaterialLocator' : PrivateToolHandle('DetailedMaterialLocator'), # GaudiHandle
    'UpdateTransport' : True, # bool
    'MaxUpdateTransports' : 10, # int
    'UpdateMaterial' : False, # bool
    'UpdateReferenceInOutlierIterations' : True, # bool
    'MinMomentumELossCorr' : 10.000000, # float
    'ApplyMaterialCorrections' : True, # bool
    'ApplyEnergyLossCorr' : True, # bool
    'TransverseMomentumForScattering' : 400.00000, # float
    'MomentumForScattering' : -1.0000000, # float
    'MinMomentumForScattering' : 100.00000, # float
    'MaxMomentumForScattering' : 500000.00, # float
    'MinNumVeloRHitsForOutlierRemoval' : 3, # int
    'MinNumVeloPhiHitsForOutlierRemoval' : 3, # int
    'MinNumTTHitsForOutlierRemoval' : 3, # int
    'MinNumTHitsForOutlierRemoval' : 6, # int
    'MinNumMuonHitsForOutlierRemoval' : 4, # int
    'MaxDeltaChiSqConverged' : 0.010000000, # float
    'UseClassicalSmoother' : False, # bool
    'FillExtraInfo' : True, # bool
  }
  _propertyDocDct = { 
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'ContextService' : """ The name of Algorithm Context Service """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'StatPrint' : """ Print the table of counters """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(TrackMasterFitter, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrackFitter'
  def getType( self ):
      return 'TrackMasterFitter'
  pass # class TrackMasterFitter
