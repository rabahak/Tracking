#Wed May 11 14:30:56 2016"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.Proxy.Configurable import *

class PrDownstream( ConfigurableAlgorithm ) :
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
    'InputLocation' : '', # str
    'OutputLocation' : 'Rec/Track/Downstream', # str
    'ForwardLocation' : 'Rec/Track/Forward', # str
    'MatchLocation' : 'Rec/Track/Match', # str
    'PrintTracks' : False, # bool
    'TimingMeasurement' : False, # bool
    'deltaP' : 2.0000000, # float
    'xPredTol' : 150000.00, # float
    'xPredTol2' : 20.000000, # float
    'TolMatch' : 1.5000000, # float
    'TolUV' : 2.0000000, # float
    'TolMomentum' : 20000.000, # float
    'maxWindowSize' : 10.000000, # float
    'MaxDistance' : 0.30000000, # float
    'MaxChisq' : 20.000000, # float
    'DeltaChisq' : 3.5000000, # float
    'errorZMagnet' : 30.000000, # float
    'minUTx' : 35.000000, # float
    'minUTy' : 35.000000, # float
    'zMagnetParams' : [ 5376.80000000 , -3895.12000000 , 309.87700000 , 85527.90000000 ], # list
    'momentumParams' : [ 1148.65000000 , 961.78600000 , 5326.81000000 ], # list
    'yParams' : [ 5.00000000 , 2000.00000000 ], # list
    'zUT' : 2485.0000, # float
    'zUTa' : 2350.0000, # float
    'StateErrorX2' : 4.0000000, # float
    'StateErrorY2' : 400.00000, # float
    'StateErrorTX2' : 6.0000000e-05, # float
    'StateErrorTY2' : 0.00010000000, # float
    'StateErrorP' : 0.15000000, # float
    'MinPt' : 0.0000000, # float
    'MinMomentum' : 0.0000000, # float
    'RemoveUsed' : False, # bool
    'RemoveAll' : False, # bool
    'LongChi2' : 1.5000000, # float
    'Mode' : True, # bool
    'RemoveHits' : True, # bool
    'TracksToKeep' : 3, # int
    'SeedKey' : -1, # int
    'WithDebugTool' : False, # bool
    'DebugTool' : 'PrDebugUTTruthTool', # str
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
      super(PrDownstream, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrDownstream'
  pass # class PrDownstream

class PrFTHitManager( ConfigurableAlgTool ) :
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
    'XSmearing' : -1.00000, # float
    'ZSmearing' : -1.00000, # float
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
      super(PrFTHitManager, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrFTHitManager'
  pass # class PrFTHitManager

class PrForwardTool( ConfigurableAlgTool ) :
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
    'HitManagerName' : 'PrFTHitManager', # str
    'AddUTHitsToolName' : 'PrAddUTHitsTool', # str
    'YToleranceUVsearch' : 11.0000, # float
    'TolY' : 5.00000, # float
    'TolYSlope' : 0.00200000, # float
    'MaxChi2LinearFit' : 100.000, # float
    'MaxChi2XProjection' : 15.0000, # float
    'MaxChi2PerDoF' : 7.00000, # float
    'TolYMag' : 10.0000, # float
    'TolYMagSlope' : 0.0150000, # float
    'MinYGap' : 0.400000, # float
    'MinTotalHits' : 10, # int
    'MaxChi2StereoLinear' : 60.0000, # float
    'MaxChi2Stereo' : 4.50000, # float
    'MinXHits' : 5, # int
    'MaxXWindow' : 1.20000, # float
    'MaxXWindowSlope' : 0.00200000, # float
    'MaxXGap' : 1.20000, # float
    'MInSingleHits' : 2, # int
    'SecondLoop' : True, # bool
    'MinXHits2nd' : 4, # int
    'MaxXWindow2nd' : 1.50000, # float
    'MaxXWindowSlope2nd' : 0.00200000, # float
    'MaxXGap2nd' : 0.500000, # float
    'Preselection' : False, # bool
    'PreselectionPT' : 400.000, # float
    'MinPt' : 50.0000, # float
    'TolYCollectX' : 4.10000, # float
    'TolYSlopeCollectX' : 0.00180000, # float
    'TolYTriangleSearch' : 20.0000, # float
    'UseMomentumEstimate' : True, # bool
    'UseWrongSignWindow' : True, # bool
    'WrongSignPT' : 2000.00, # float
    'MaxQuality' : 0.900000, # float
    'DeltaQuality' : 0.100000, # float
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
      super(PrForwardTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrForwardTool'
  pass # class PrForwardTool

class PrForwardTracking( ConfigurableAlgorithm ) :
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
    'InputName' : 'Rec/Track/Velo', # str
    'OutputName' : 'Rec/Track/Forward', # str
    'HitManagerName' : 'PrFTHitManager', # str
    'ForwardToolName' : 'PrForwardTool', # str
    'DeltaQuality' : 0.100000, # float
    'DebugToolName' : '', # str
    'WantedKey' : -100, # int
    'VeloKey' : -100, # int
    'TimingMeasurement' : False, # bool
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
      super(PrForwardTracking, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrForwardTracking'
  pass # class PrForwardTracking

class PrGeometryTool( ConfigurableAlgTool ) :
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
    'zReference' : 8520.00, # float
    'zMagnetParams' : [  ], # list
    'xParams' : [  ], # list
    'byParams' : [  ], # list
    'cyParams' : [  ], # list
    'momentumParams' : [  ], # list
    'covarianceValues' : [  ], # list
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
      super(PrGeometryTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrGeometryTool'
  pass # class PrGeometryTool

class PrHybridSeeding( ConfigurableAlgorithm ) :
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
    'maxNbestCluster' : [ 2 , 4 , 4 ], # list
    'InputName' : '', # str
    'Recover' : True, # bool
    'nUsedThreshold' : [ 2 , 1 , 1 ], # list
    'Recover_tolTy' : 0.0100000, # float
    'Recover_MaxNCluster' : 3, # int
    'Recover_maxY0' : 1800.00, # float
    'Recover_minTotHits' : 9, # int
    'Recover_minUV' : [ 4 , 5 , 5 ], # list
    'OutputName' : 'Rec/Track/Seed', # str
    'HitManagerName' : 'PrFTHitManager', # str
    'DecodeData' : False, # bool
    'XOnly' : False, # bool
    'MinXPlanes' : 4, # int
    'MaxNHits' : 12, # int
    'NCases' : 3, # int
    'TimingMeasurement' : False, # bool
    'PrintSettings' : False, # bool
    'RemoveClones' : True, # bool
    'FracCommon' : 0.700000, # float
    'RemoveClonesX' : True, # bool
    'FlagHits' : True, # bool
    'RemoveFlagged' : True, # bool
    'dRatio' : -0.000262000, # float
    'CConst' : 2.45800e+08, # float
    'UseCorrPosition' : True, # bool
    'SizeToFlag' : [ 12 , 11 , 10 ], # list
    'Flag_MaxChi2DoF_11Hits' : [ 0.500000 , 1.000000 , 1.000000 ], # list
    'Flag_MaxX0_11Hits' : [ 100.000000 , 8000.000000 , 200.000000 ], # list
    'L0_AlphaCorr' : [ 120.639999 , 510.640015 , 730.640015 ], # list
    'L0_tolHp' : [ 280.000000 , 540.000000 , 1080.000000 ], # list
    'maxParabolaSeedHits' : 8, # int
    'x0Corr' : [ 0.002152 , 0.001534 , 0.001834 ], # list
    'X0SlopeChange' : [ 400.000000 , 500.000000 , 500.000000 ], # list
    'ToleranceX0Up' : [ 0.750000 , 0.750000 , 0.750000 ], # list
    'x0Cut' : [ 1500.000000 , 4000.000000 , 6000.000000 ], # list
    'TolAtX0Cut' : [ 4.500000 , 8.000000 , 14.000000 ], # list
    'X0SlopeChangeDown' : [ 2000.000000 , 2000.000000 , 2000.000000 ], # list
    'TolAtX0CutOpp' : [ 0.750000 , 2.000000 , 7.000000 ], # list
    'ToleranceX0Down' : [ 0.750000 , 0.750000 , 0.750000 ], # list
    'TolXRemaining' : [ 1.000000 , 1.000000 , 1.000000 ], # list
    'maxChi2HitsX' : [ 5.500000 , 5.500000 , 5.500000 ], # list
    'maxChi2DoFX' : [ 4.000000 , 5.000000 , 6.000000 ], # list
    'RemoveHole' : True, # bool
    'RadiusHole' : 87.0000, # float
    'yMin' : -1.00000, # float
    'yMin_TrFix' : -2.00000, # float
    'yMax' : 2700.00, # float
    'yMax_TrFix' : 30.0000, # float
    'DoAsymm' : 1.00000, # float
    'TriangleFix' : True, # bool
    'TriangleFix2ndOrder' : True, # bool
    'minUV6' : [ 4 , 4 , 4 ], # list
    'minUV5' : [ 5 , 5 , 4 ], # list
    'minUV4' : [ 6 , 6 , 5 ], # list
    'Chi2LowLine' : [ 5.000000 , 6.500000 , 7.500000 ], # list
    'Chi2HighLine' : [ 30.000000 , 50.000000 , 80.000000 ], # list
    'minTot' : [ 9 , 9 , 9 ], # list
    'TolTyOffset' : [ 0.001700 , 0.002500 , 0.003500 ], # list
    'TolTySlope' : [ 0.000000 , 0.025000 , 0.035000 ], # list
    'maxChi2Hits_11and12Hit' : [ 5.500000 , 5.500000 , 5.500000 ], # list
    'maxChi2Hits_less11Hit' : [ 2.500000 , 2.500000 , 2.500000 ], # list
    'maxYatZeroLow' : [ 50.000000 , 60.000000 , 70.000000 ], # list
    'maxYatzRefLow' : [ 400.000000 , 550.000000 , 700.000000 ], # list
    'maxChi2PerDoF' : [ 4.000000 , 6.000000 , 7.000000 ], # list
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
      super(PrHybridSeeding, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrHybridSeeding'
  pass # class PrHybridSeeding

class PrMatch( ConfigurableAlgorithm ) :
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
    'VeloInput' : 'Rec/Track/Velo', # str
    'SeedInput' : 'Rec/Track/Seed', # str
    'MatchOutput' : 'Rec/Track/Match', # str
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
      super(PrMatch, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrMatch'
  pass # class PrMatch

class PrMatchNN( ConfigurableAlgorithm ) :
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
    'VeloInput' : 'Rec/Track/Velo', # str
    'SeedInput' : 'Rec/Track/Seed', # str
    'MatchOutput' : 'Rec/Track/Match', # str
    'MatchToolName' : 'PrMatchToolNN', # str
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
      super(PrMatchNN, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrMatchNN'
  pass # class PrMatchNN

class PrMatchTool( ConfigurableAlgTool ) :
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
    'zMagnet' : 5200.0000, # float
    'zMagnetTx2' : -1700.0000, # float
    'zMagnetDsl2' : 500.00000, # float
    'zMatchY' : 8420.0000, # float
    'dxTol' : 8.0000000, # float
    'dxTolSlope' : 80.000000, # float
    'dyTol' : 6.0000000, # float
    'dyTolSlope' : 300.00000, # float
    'MagnetBend' : -1000.0000, # float
    'maxMatchChi2' : 4.0000000, # float
    'MinPt' : 0.0000000, # float
    'MinMomentum' : 0.0000000, # float
    'FastMomentumToolName' : 'FastMomentumEstimate', # str
    'AddUTHits' : True, # bool
    'AddUTHitsToolName' : 'PrAddUTHitsTool', # str
    'writeNNVariables' : True, # bool
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
      super(PrMatchTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrMatchTool'
  pass # class PrMatchTool

class PrMatchToolNN( ConfigurableAlgTool ) :
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
    'zMagnet' : 5200.0000, # float
    'zMagnetTx2' : -1700.0000, # float
    'zMagnetDsl2' : 500.00000, # float
    'zMatchY' : 8420.0000, # float
    'dxTol' : 8.0000000, # float
    'dxTolSlope' : 80.000000, # float
    'dyTol' : 6.0000000, # float
    'dyTolSlope' : 300.00000, # float
    'MagnetBend' : -1000.0000, # float
    'MinPt' : 0.0000000, # float
    'MinMomentum' : 0.0000000, # float
    'maxMatchChi2' : 20.000000, # float
    'maxMatchNN' : 0.90000000, # float
    'maxdDist' : 0.20000000, # float
    'AddUTHits' : False, # bool
    'AddUTHitsToolName' : 'PrAddUTHitsTool', # str
    'writeNNVariables' : True, # bool
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
      super(PrMatchToolNN, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrAlgorithms'
  def getType( self ):
      return 'PrMatchToolNN'
  pass # class PrMatchToolNN
