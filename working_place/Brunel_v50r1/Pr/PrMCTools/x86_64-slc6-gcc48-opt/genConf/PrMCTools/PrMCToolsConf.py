#Thu May 12 19:34:27 2016"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.GaudiHandles import *
from GaudiKernel.Proxy.Configurable import *

class PrCheatedSciFiTracking( ConfigurableAlgorithm ) :
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
    'HistoProduce' : True, # bool
    'HistoPrint' : False, # bool
    'HistoCountersPrint' : True, # bool
    'HistoCheckForNaN' : True, # bool
    'HistoSplitDir' : False, # bool
    'HistoOffSet' : 0, # int
    'HistoTopDir' : '', # str
    'HistoDir' : 'DefaultName', # str
    'FullDetail' : False, # bool
    'MonitorHistograms' : True, # bool
    'FormatFor1DHistoTable' : '| %2$-45.45s | %3$=7d |%8$11.5g | %10$-11.5g|%12$11.5g |%14$11.5g |', # str
    'ShortFormatFor1DHistoTable' : ' | %1$-25.25s %2%', # str
    'HeaderFor1DHistoTable' : '|   Title                                       |    #    |     Mean   |    RMS     |  Skewness  |  Kurtosis  |', # str
    'UseSequencialNumericAutoIDs' : False, # bool
    'AutoStringIDPurgeMap' : { '/' : '=SLASH=' }, # list
    'HitManagerName' : 'PrFTHitManager', # str
    'DecodeData' : False, # bool
    'OutputName' : 'Rec/Track/Seed', # str
    'NumZones' : 24, # int
    'MinXHits' : 5, # int
    'MinStereoHits' : 5, # int
    'MinTotHits' : 10, # int
  }
  _propertyDocDct = { 
    'AutoStringIDPurgeMap' : """ Map of strings to search and replace when using the title as the basis of automatically generated literal IDs """,
    'UseSequencialNumericAutoIDs' : """ Flag to allow users to switch back to the old style of creating numerical automatic IDs """,
    'FormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'HistoDir' : """ Histogram Directory """,
    'HistoOffSet' : """ OffSet for automatically assigned histogram numerical identifiers  """,
    'HeaderFor1DHistoTable' : """ The table header for printout of 1D histograms  """,
    'ShortFormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'Cardinality' : """ How many clones to create """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'StatPrint' : """ Print the table of counters """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'VetoObjects' : """ Skip execute if one or more of these TES objects exists """,
    'RequireObjects' : """ Execute only if one or more of these TES objects exists """,
    'HistoSplitDir' : """ Split long directory names into short pieces (suitable for HBOOK) """,
    'HistoPrint' : """ Switch on/off the printout of histograms at finalization """,
    'HistoCheckForNaN' : """ Switch on/off the checks for NaN and Infinity for histogram fill """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoProduce' : """ Switch on/off the production of histograms """,
    'HistoCountersPrint' : """ Switch on/off the printout of histogram counters at finalization """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoTopDir' : """ Top level histogram directory (take care that it ends with '/') """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(PrCheatedSciFiTracking, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrCheatedSciFiTracking'
  pass # class PrCheatedSciFiTracking

class PrCheatedVP( ConfigurableAlgorithm ) :
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
    'UseMCHits' : False, # bool
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
      super(PrCheatedVP, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrCheatedVP'
  pass # class PrCheatedVP

class PrCheatedVelo( ConfigurableAlgorithm ) :
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
      super(PrCheatedVelo, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrCheatedVelo'
  pass # class PrCheatedVelo

class PrChecker( ConfigurableAlgorithm ) :
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
    'HistoProduce' : True, # bool
    'HistoPrint' : False, # bool
    'HistoCountersPrint' : True, # bool
    'HistoCheckForNaN' : True, # bool
    'HistoSplitDir' : False, # bool
    'HistoOffSet' : 0, # int
    'HistoTopDir' : '', # str
    'HistoDir' : 'DefaultName', # str
    'FullDetail' : False, # bool
    'MonitorHistograms' : True, # bool
    'FormatFor1DHistoTable' : '| %2$-45.45s | %3$=7d |%8$11.5g | %10$-11.5g|%12$11.5g |%14$11.5g |', # str
    'ShortFormatFor1DHistoTable' : ' | %1$-25.25s %2%', # str
    'HeaderFor1DHistoTable' : '|   Title                                       |    #    |     Mean   |    RMS     |  Skewness  |  Kurtosis  |', # str
    'UseSequencialNumericAutoIDs' : False, # bool
    'AutoStringIDPurgeMap' : { '/' : '=SLASH=' }, # list
    'VeloTracks' : 'Rec/Track/Velo', # str
    'ForwardTracks' : 'Rec/Track/Forward', # str
    'MatchTracks' : 'Rec/Track/Match', # str
    'SeedTracks' : 'Rec/Track/Seed', # str
    'DownTracks' : 'Rec/Track/Downstream', # str
    'UpTracks' : 'Rec/Track/VeloTT', # str
    'BestTracks' : 'Rec/Track/Best', # str
    'WriteVeloHistos' : -1, # int
    'WriteForwardHistos' : -1, # int
    'WriteMatchHistos' : -1, # int
    'WriteDownHistos' : -1, # int
    'WriteUpHistos' : -1, # int
    'WriteTTrackHistos' : -1, # int
    'WriteBestHistos' : -1, # int
    'WriteBestLongHistos' : -1, # int
    'WriteBestDownstreamHistos' : -1, # int
    'WriteUTHistos' : -1, # int
    'Eta25Cut' : False, # bool
    'TriggerNumbers' : False, # bool
    'UseElectrons' : False, # bool
    'GhostProbCut' : 1.0000000, # float
    'Upgrade' : True, # bool
  }
  _propertyDocDct = { 
    'AutoStringIDPurgeMap' : """ Map of strings to search and replace when using the title as the basis of automatically generated literal IDs """,
    'UseSequencialNumericAutoIDs' : """ Flag to allow users to switch back to the old style of creating numerical automatic IDs """,
    'FormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'HistoDir' : """ Histogram Directory """,
    'HistoOffSet' : """ OffSet for automatically assigned histogram numerical identifiers  """,
    'HeaderFor1DHistoTable' : """ The table header for printout of 1D histograms  """,
    'ShortFormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'Cardinality' : """ How many clones to create """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'StatPrint' : """ Print the table of counters """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'VetoObjects' : """ Skip execute if one or more of these TES objects exists """,
    'RequireObjects' : """ Execute only if one or more of these TES objects exists """,
    'HistoSplitDir' : """ Split long directory names into short pieces (suitable for HBOOK) """,
    'HistoPrint' : """ Switch on/off the printout of histograms at finalization """,
    'HistoCheckForNaN' : """ Switch on/off the checks for NaN and Infinity for histogram fill """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoProduce' : """ Switch on/off the production of histograms """,
    'HistoCountersPrint' : """ Switch on/off the printout of histogram counters at finalization """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoTopDir' : """ Top level histogram directory (take care that it ends with '/') """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(PrChecker, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrChecker'
  pass # class PrChecker

class PrChecker2( ConfigurableAlgorithm ) :
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
    'HistoProduce' : True, # bool
    'HistoPrint' : False, # bool
    'HistoCountersPrint' : True, # bool
    'HistoCheckForNaN' : True, # bool
    'HistoSplitDir' : False, # bool
    'HistoOffSet' : 0, # int
    'HistoTopDir' : '', # str
    'HistoDir' : 'DefaultName', # str
    'FullDetail' : False, # bool
    'MonitorHistograms' : True, # bool
    'FormatFor1DHistoTable' : '| %2$-45.45s | %3$=7d |%8$11.5g | %10$-11.5g|%12$11.5g |%14$11.5g |', # str
    'ShortFormatFor1DHistoTable' : ' | %1$-25.25s %2%', # str
    'HeaderFor1DHistoTable' : '|   Title                                       |    #    |     Mean   |    RMS     |  Skewness  |  Kurtosis  |', # str
    'UseSequencialNumericAutoIDs' : False, # bool
    'AutoStringIDPurgeMap' : { '/' : '=SLASH=' }, # list
    'VeloTracks' : 'Rec/Track/Velo', # str
    'ForwardTracks' : 'Rec/Track/Forward', # str
    'MatchTracks' : 'Rec/Track/Match', # str
    'SeedTracks' : 'Rec/Track/Seed', # str
    'DownTracks' : 'Rec/Track/Downstream', # str
    'UpTracks' : 'Rec/Track/VeloTT', # str
    'BestTracks' : 'Rec/Track/Best', # str
    'NewTracks' : 'Rec/Track/VeloTT', # str
    'NewTTTracks' : 'Rec/Track/VeloTT', # str
    'WriteVeloHistos' : -1, # int
    'WriteForwardHistos' : -1, # int
    'WriteMatchHistos' : -1, # int
    'WriteDownHistos' : -1, # int
    'WriteUpHistos' : -1, # int
    'WriteTTrackHistos' : -1, # int
    'WriteBestHistos' : -1, # int
    'WriteBestLongHistos' : -1, # int
    'WriteBestDownstreamHistos' : -1, # int
    'WriteNewHistos' : -1, # int
    'WriteUTHistos' : -1, # int
    'WriteTTForwardHistos' : -1, # int
    'WriteTTMatchHistos' : -1, # int
    'WriteTTDownstHistos' : -1, # int
    'WriteTTNewHistos' : -1, # int
    'SelectIdNewContainer' : 1, # int
    'SelectIdNewTTContainer' : 1, # int
    'Eta25Cut' : False, # bool
    'TriggerNumbers' : False, # bool
    'VetoElectrons' : True, # bool
    'TrackExtrapolation' : False, # bool
    'MyForwardCuts' : { '01_long' : 'isLong ' , '02_long>5GeV' : 'isLong & over5 ' , '03_long_strange' : 'isLong & strange ' , '04_long_strange>5GeV' : 'isLong & strange & over5 ' , '05_long_fromB' : 'isLong & fromB ' , '06_long_fromB>5GeV' : 'isLong & fromB & over5 ' }, # list
    'MyVeloCuts' : { '01_velo' : 'isVelo ' , '02_long' : 'isLong ' , '03_long>5GeV' : 'isLong & over5  ' , '04_long_strange' : 'isLong & strange ' , '05_long_strange>5GeV' : 'isLong & strange & over5 ' , '06_long_fromB' : 'isLong & fromB ' , '07_long_fromB>5GeV' : 'isLong & fromB & over5 ' }, # list
    'MyUpCuts' : { '01_velo' : 'isVelo ' , '02_velo+UT' : 'isVelo & isTT ' , '03_velo+UT>5GeV' : 'isVelo & isTT & over5 ' , '04_velo+notLong' : 'isNotLong & isVelo  ' , '05_velo+UT+notLong' : 'isNotLong & isVelo & isTT ' , '06_velo+UT+notLong>5GeV' : 'isNotLong & isVelo & isTT & over5 ' , '07_long' : 'isLong ' , '08_long>5GeV' : 'isLong & over5  ' , '09_long_fromB' : 'isLong & fromB ' , '10_long_fromB>5GeV' : 'isLong & fromB & over5 ' }, # list
    'MyTtrackCuts' : { '01_hasT' : 'isSeed ' , '02_long' : 'isLong ' , '03_long>5GeV' : 'isLong & over5 ' , '04_long_fromB' : 'isLong & fromB ' , '05_long_fromB>5GeV' : 'isLong & fromB & over5 ' , '06_UT+T_strange' : ' strange & isDown ' , '07_UT+T_strange>5GeV' : ' strange & isDown & over5' , '08_noVelo+UT+T_strange' : ' strange & isDown & isNotVelo' , '09_noVelo+UT+T_strange>5GeV' : ' strange & isDown & over5 & isNotVelo ' , '10_UT+T_SfromDB' : ' strange & isDown & ( fromB | fromD ) ' , '11_UT+T_SfromDB>5GeV' : ' strange & isDown & over5 & ( fromB | fromD )' , '12_noVelo+UT+T_SfromDB>5GeV' : ' strange & isDown & isNotVelo & over5 & ( fromB | fromD ) ' }, # list
    'MyDownCuts' : { '01_UT+T' : 'isDown ' , '02_UT+T>5GeV' : 'isDown & over5' , '03_UT+T_strange' : ' strange & isDown' , '04_UT+T_strange>5GeV' : ' strange & isDown & over5 ' , '05_noVelo+UT+T_strange' : ' strange & isDown & isNotVelo' , '06_noVelo+UT+T_strange>5GeV' : ' strange & isDown & over5 & isNotVelo ' , '07_UT+T_fromB' : 'isDown & fromB ' , '08_UT+T_fromB>5GeV' : 'isDown & fromB & over5 ' , '09_noVelo+UT+T_fromB' : 'isDown & fromB & isNotVelo' , '10_noVelo+UT+T_fromB>5GeV' : 'isDown & fromB & over5 & isNotVelo' , '11_UT+T_SfromDB' : ' strange & isDown & ( fromB | fromD ) ' , '12_UT+T_SfromDB>5GeV' : ' strange & isDown & over5 & ( fromB | fromD ) ' , '13_noVelo+UT+T_SfromDB' : ' strange & isDown & isNotVelo & ( fromB | fromD )' , '14_noVelo+UT+T_SfromDB>5GeV' : ' strange & isDown & isNotVelo & over5 & ( fromB | fromD ) ' }, # list
    'MyNewCuts' : {  }, # list
    'MyTTForwardCuts' : { '01_long' : 'isLong ' , '02_long>5GeV' : 'isLong & over5  ' }, # list
    'MyTTDownCuts' : { '01_has seed' : 'isSeed ' , '02_has seed +noVelo, T+TT' : 'isSeed & isNotVelo & isDown ' , '03_down+strange' : ' strange & isDown' , '04_down+strange+>5GeV' : ' strange & isDown & over5 ' , '05_pi<-Ks<-B' : 'fromKsFromB ' , '06_pi<-Ks<-B+> 5 GeV' : 'fromKsFromB & over5 ' }, # list
    'MyTTNewCuts' : {  }, # list
    'Upgrade' : True, # bool
    'WriteTexOutput' : False, # bool
    'TexOutputName' : 'efficiencies', # str
    'TexOutputFolder' : '', # str
  }
  _propertyDocDct = { 
    'AutoStringIDPurgeMap' : """ Map of strings to search and replace when using the title as the basis of automatically generated literal IDs """,
    'UseSequencialNumericAutoIDs' : """ Flag to allow users to switch back to the old style of creating numerical automatic IDs """,
    'FormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'HistoDir' : """ Histogram Directory """,
    'HistoOffSet' : """ OffSet for automatically assigned histogram numerical identifiers  """,
    'HeaderFor1DHistoTable' : """ The table header for printout of 1D histograms  """,
    'ShortFormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'Cardinality' : """ How many clones to create """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'StatPrint' : """ Print the table of counters """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'VetoObjects' : """ Skip execute if one or more of these TES objects exists """,
    'RequireObjects' : """ Execute only if one or more of these TES objects exists """,
    'HistoSplitDir' : """ Split long directory names into short pieces (suitable for HBOOK) """,
    'HistoPrint' : """ Switch on/off the printout of histograms at finalization """,
    'HistoCheckForNaN' : """ Switch on/off the checks for NaN and Infinity for histogram fill """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoProduce' : """ Switch on/off the production of histograms """,
    'HistoCountersPrint' : """ Switch on/off the printout of histogram counters at finalization """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoTopDir' : """ Top level histogram directory (take care that it ends with '/') """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(PrChecker2, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrChecker2'
  pass # class PrChecker2

class PrClustersResidual( ConfigurableAlgorithm ) :
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
    'HistoProduce' : True, # bool
    'HistoPrint' : False, # bool
    'HistoCountersPrint' : True, # bool
    'HistoCheckForNaN' : True, # bool
    'HistoSplitDir' : False, # bool
    'HistoOffSet' : 0, # int
    'HistoTopDir' : '', # str
    'HistoDir' : 'DefaultName', # str
    'FullDetail' : False, # bool
    'MonitorHistograms' : True, # bool
    'FormatFor1DHistoTable' : '| %2$-45.45s | %3$=7d |%8$11.5g | %10$-11.5g|%12$11.5g |%14$11.5g |', # str
    'ShortFormatFor1DHistoTable' : ' | %1$-25.25s %2%', # str
    'HeaderFor1DHistoTable' : '|   Title                                       |    #    |     Mean   |    RMS     |  Skewness  |  Kurtosis  |', # str
    'UseSequencialNumericAutoIDs' : False, # bool
    'AutoStringIDPurgeMap' : { '/' : '=SLASH=' }, # list
    'NTupleProduce' : True, # bool
    'NTuplePrint' : True, # bool
    'NTupleSplitDir' : False, # bool
    'NTupleOffSet' : 0, # int
    'NTupleLUN' : 'FILE1', # str
    'NTupleTopDir' : '', # str
    'NTupleDir' : 'DefaultName', # str
    'EvtColsProduce' : False, # bool
    'EvtColsPrint' : False, # bool
    'EvtColSplitDir' : False, # bool
    'EvtColOffSet' : 0, # int
    'EvtColLUN' : 'EVTCOL', # str
    'EvtColTopDir' : '', # str
    'EvtColDir' : 'DefaultName', # str
    'MCHitsLocation' : '/Event/MC/FT/Hits', # str
    'HitManagerName' : 'PrFTHitManager', # str
    'DebugTracking' : False, # bool
    'DoClusterResidual' : False, # bool
    'DoTrackStudy' : False, # bool
    'DecodeData' : False, # bool
    'OnlyHasT' : False, # bool
    'RemoveClones' : True, # bool
    'DumpAllHits' : False, # bool
    'Occupancy' : True, # bool
  }
  _propertyDocDct = { 
    'EvtColOffSet' : """ Offset for numerical N-tuple ID """,
    'EvtColDir' : """ Subdirectory for Event Tag Collections """,
    'EvtColSplitDir' : """ Split long directory names into short pieces """,
    'EvtColsProduce' : """ General switch to enable/disable Event Tag Collections """,
    'NTupleDir' : """ Subdirectory for N-Tuples """,
    'NTupleOffSet' : """ Offset for numerical N-tuple ID """,
    'NTupleSplitDir' : """ Split long directory names into short pieces (suitable for HBOOK) """,
    'NTupleProduce' : """ General switch to enable/disable N-tuples """,
    'AutoStringIDPurgeMap' : """ Map of strings to search and replace when using the title as the basis of automatically generated literal IDs """,
    'UseSequencialNumericAutoIDs' : """ Flag to allow users to switch back to the old style of creating numerical automatic IDs """,
    'NTupleLUN' : """ Logical File Unit for N-tuples """,
    'FormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'HistoDir' : """ Histogram Directory """,
    'NTuplePrint' : """ Print N-tuple statistics """,
    'HistoOffSet' : """ OffSet for automatically assigned histogram numerical identifiers  """,
    'NTupleTopDir' : """ Top-level directory for N-Tuples """,
    'HeaderFor1DHistoTable' : """ The table header for printout of 1D histograms  """,
    'ShortFormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'Cardinality' : """ How many clones to create """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'StatPrint' : """ Print the table of counters """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
    'EvtColLUN' : """ Logical File Unit for Event Tag Collections """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'EvtColsPrint' : """ Print statistics for Event Tag Collections  """,
    'VetoObjects' : """ Skip execute if one or more of these TES objects exists """,
    'RequireObjects' : """ Execute only if one or more of these TES objects exists """,
    'HistoSplitDir' : """ Split long directory names into short pieces (suitable for HBOOK) """,
    'EvtColTopDir' : """ Top-level directory for Event Tag Collections """,
    'HistoPrint' : """ Switch on/off the printout of histograms at finalization """,
    'HistoCheckForNaN' : """ Switch on/off the checks for NaN and Infinity for histogram fill """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoProduce' : """ Switch on/off the production of histograms """,
    'HistoCountersPrint' : """ Switch on/off the printout of histogram counters at finalization """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoTopDir' : """ Top level histogram directory (take care that it ends with '/') """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(PrClustersResidual, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrClustersResidual'
  pass # class PrClustersResidual

class PrCounter( ConfigurableAlgTool ) :
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
    'TitleSize' : 30, # int
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
      super(PrCounter, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrCounter'
  pass # class PrCounter

class PrCounter2( ConfigurableAlgTool ) :
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
    'TitleSize' : 40, # int
    'Selector' : PrivateToolHandle(''), # GaudiHandle
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
      super(PrCounter2, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrCounter2'
  pass # class PrCounter2

class PrDebugTrackingLosses( ConfigurableAlgorithm ) :
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
    'Velo' : False, # bool
    'Forward' : False, # bool
    'Seed' : False, # bool
    'Ghost' : False, # bool
    'Clone' : False, # bool
    'FromStrange' : False, # bool
    'FromBeauty' : False, # bool
    'MinMomentum' : 5000.0000, # float
    'SaveList' : False, # bool
    'VeloName' : 'Rec/Track/Velo', # str
    'ForwardName' : 'Rec/Track/Forward', # str
    'SeedName' : 'Rec/Track/Seed', # str
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
      super(PrDebugTrackingLosses, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrDebugTrackingLosses'
  pass # class PrDebugTrackingLosses

class PrLHCbID2MCParticle( ConfigurableAlgorithm ) :
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
    'TargetName' : 'Pr/LHCbID', # str
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
      super(PrLHCbID2MCParticle, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrLHCbID2MCParticle'
  pass # class PrLHCbID2MCParticle

class PrPixelDebugTool( ConfigurableAlgTool ) :
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
      super(PrPixelDebugTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrPixelDebugTool'
  pass # class PrPixelDebugTool

class PrPlotFTHits( ConfigurableAlgorithm ) :
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
    'HistoProduce' : True, # bool
    'HistoPrint' : False, # bool
    'HistoCountersPrint' : True, # bool
    'HistoCheckForNaN' : True, # bool
    'HistoSplitDir' : False, # bool
    'HistoOffSet' : 0, # int
    'HistoTopDir' : '', # str
    'HistoDir' : 'DefaultName', # str
    'FullDetail' : False, # bool
    'MonitorHistograms' : True, # bool
    'FormatFor1DHistoTable' : '| %2$-45.45s | %3$=7d |%8$11.5g | %10$-11.5g|%12$11.5g |%14$11.5g |', # str
    'ShortFormatFor1DHistoTable' : ' | %1$-25.25s %2%', # str
    'HeaderFor1DHistoTable' : '|   Title                                       |    #    |     Mean   |    RMS     |  Skewness  |  Kurtosis  |', # str
    'UseSequencialNumericAutoIDs' : False, # bool
    'AutoStringIDPurgeMap' : { '/' : '=SLASH=' }, # list
    'PlotStates' : False, # bool
    'ExcludeElectrons' : True, # bool
    'PlotHitEfficiency' : True, # bool
    'PlotAllFTHits' : True, # bool
    'PlotFTHitsOnTrack' : True, # bool
    'PlotTrackingEfficiency' : True, # bool
    'PlotMCHits' : True, # bool
    'OnlyLongAndDownForMCHits' : True, # bool
    'PlotOccupancy' : False, # bool
  }
  _propertyDocDct = { 
    'AutoStringIDPurgeMap' : """ Map of strings to search and replace when using the title as the basis of automatically generated literal IDs """,
    'UseSequencialNumericAutoIDs' : """ Flag to allow users to switch back to the old style of creating numerical automatic IDs """,
    'FormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'HistoDir' : """ Histogram Directory """,
    'HistoOffSet' : """ OffSet for automatically assigned histogram numerical identifiers  """,
    'HeaderFor1DHistoTable' : """ The table header for printout of 1D histograms  """,
    'ShortFormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'Cardinality' : """ How many clones to create """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'StatPrint' : """ Print the table of counters """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'VetoObjects' : """ Skip execute if one or more of these TES objects exists """,
    'RequireObjects' : """ Execute only if one or more of these TES objects exists """,
    'HistoSplitDir' : """ Split long directory names into short pieces (suitable for HBOOK) """,
    'HistoPrint' : """ Switch on/off the printout of histograms at finalization """,
    'HistoCheckForNaN' : """ Switch on/off the checks for NaN and Infinity for histogram fill """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoProduce' : """ Switch on/off the production of histograms """,
    'HistoCountersPrint' : """ Switch on/off the printout of histogram counters at finalization """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoTopDir' : """ Top level histogram directory (take care that it ends with '/') """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(PrPlotFTHits, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrPlotFTHits'
  pass # class PrPlotFTHits

class PrTStationDebugTool( ConfigurableAlgTool ) :
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
      super(PrTStationDebugTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrTStationDebugTool'
  pass # class PrTStationDebugTool

class PrTTCounter( ConfigurableAlgTool ) :
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
    'TitleSize' : 40, # int
    'Selector' : PrivateToolHandle(''), # GaudiHandle
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
      super(PrTTCounter, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrTTCounter'
  pass # class PrTTCounter

class PrTrackAssociator( ConfigurableAlgorithm ) :
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
    'RootOfContainers' : '/Event/Rec/Track', # str
    'SingleContainer' : '', # str
    'FractionOK' : 0.70000000, # float
    'TrackContainerIDs' : [ 403226 , 10010 ], # list
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
      super(PrTrackAssociator, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrTrackAssociator'
  pass # class PrTrackAssociator

class PrVeloUTChecker( ConfigurableAlgorithm ) :
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
    'HistoProduce' : True, # bool
    'HistoPrint' : False, # bool
    'HistoCountersPrint' : True, # bool
    'HistoCheckForNaN' : True, # bool
    'HistoSplitDir' : False, # bool
    'HistoOffSet' : 0, # int
    'HistoTopDir' : '', # str
    'HistoDir' : 'DefaultName', # str
    'FullDetail' : False, # bool
    'MonitorHistograms' : True, # bool
    'FormatFor1DHistoTable' : '| %2$-45.45s | %3$=7d |%8$11.5g | %10$-11.5g|%12$11.5g |%14$11.5g |', # str
    'ShortFormatFor1DHistoTable' : ' | %1$-25.25s %2%', # str
    'HeaderFor1DHistoTable' : '|   Title                                       |    #    |     Mean   |    RMS     |  Skewness  |  Kurtosis  |', # str
    'UseSequencialNumericAutoIDs' : False, # bool
    'AutoStringIDPurgeMap' : { '/' : '=SLASH=' }, # list
    'VeloTTContainer' : 'Rec/Track/VeloTT', # str
    'VeloContainer' : 'Rec/Track/Velo', # str
    'ForwardContainer' : 'Rec/Track/Forward', # str
  }
  _propertyDocDct = { 
    'AutoStringIDPurgeMap' : """ Map of strings to search and replace when using the title as the basis of automatically generated literal IDs """,
    'UseSequencialNumericAutoIDs' : """ Flag to allow users to switch back to the old style of creating numerical automatic IDs """,
    'FormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'HistoDir' : """ Histogram Directory """,
    'HistoOffSet' : """ OffSet for automatically assigned histogram numerical identifiers  """,
    'HeaderFor1DHistoTable' : """ The table header for printout of 1D histograms  """,
    'ShortFormatFor1DHistoTable' : """ Format string for printout of 1D histograms """,
    'StatTableHeader' : """ The header row for the output Stat-table """,
    'Cardinality' : """ How many clones to create """,
    'PropertiesPrint' : """ Print the properties of the component  """,
    'ErrorsPrint' : """ Print the statistics of errors/warnings/exceptions """,
    'StatPrint' : """ Print the table of counters """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'UseEfficiencyRowFormat' : """ Use the special format for printout of efficiency counters """,
    'CounterList' : """ RegEx list, of simple integer counters for CounterSummary. """,
    'TypePrint' : """ Add the actal C++ component type into the messages """,
    'StatEntityList' : """ RegEx list, of StatEntity counters for CounterSummary. """,
    'VetoObjects' : """ Skip execute if one or more of these TES objects exists """,
    'RequireObjects' : """ Execute only if one or more of these TES objects exists """,
    'HistoSplitDir' : """ Split long directory names into short pieces (suitable for HBOOK) """,
    'HistoPrint' : """ Switch on/off the printout of histograms at finalization """,
    'HistoCheckForNaN' : """ Switch on/off the checks for NaN and Infinity for histogram fill """,
    'EfficiencyRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoProduce' : """ Switch on/off the production of histograms """,
    'HistoCountersPrint' : """ Switch on/off the printout of histogram counters at finalization """,
    'RegularRowFormat' : """ The format for the regular row in the output Stat-table """,
    'HistoTopDir' : """ Top level histogram directory (take care that it ends with '/') """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(PrVeloUTChecker, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'PrMCTools'
  def getType( self ):
      return 'PrVeloUTChecker'
  pass # class PrVeloUTChecker
