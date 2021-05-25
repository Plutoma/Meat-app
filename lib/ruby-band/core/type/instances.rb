require 'java'
require 'ruport'
require 'json'

module Core

  java_import "weka.core.SerializationHelper"
  module Type
    
    java_import "weka.core.Instances"
    java_import 'java.io.File'
    java_import 'weka.core.converters.CSVSaver'
    java_import 'weka.core.converters.