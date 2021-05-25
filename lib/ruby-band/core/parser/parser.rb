require 'java'
java_import 'weka.core.converters.CSVLoader'
java_import 'weka.core.converters.ArffLoader'

module Core
  module Parser
    java_import 'java.io.File'

    # Parse an ARFF file and create an Instances object
    def Parser.parse_ARFF(arff_file)
      loader = ArffLoader.new
      