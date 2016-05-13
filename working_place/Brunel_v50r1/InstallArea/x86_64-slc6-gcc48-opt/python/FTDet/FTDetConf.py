#Thu May 12 19:33:21 2016"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.Proxy.Configurable import *

class DeFTTestAlg( ConfigurableAlgorithm ) :
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
      super(DeFTTestAlg, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'FTDet'
  def getType( self ):
      return 'DeFTTestAlg'
  pass # class DeFTTestAlg
