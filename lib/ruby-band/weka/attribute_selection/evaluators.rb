require 'ruby-band/weka/attribute_selection/utils'

module Weka
  module AttributeSelection

    # This module contains evaluators from the 'weka.attributeSelection' packages
    module Evaluator
      java_import 'weka.attributeSelection.CfsSubsetEval'
      java_import 'weka.attributeSelection.CorrelationAttributeEval'
      java_import 'weka.attributeSelection.GainRatioAttributeEval'
      java_import 'weka.attributeSelection.InfoGainAttributeEval'
      java_import 'weka.attributeSelection.OneRAttributeEval'
      java_import 'weka.attributeSelection.ReliefFAttributeEval'
      java_import 'weka.attributeSel