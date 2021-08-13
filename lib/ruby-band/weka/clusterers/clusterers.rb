require 'ruby-band/weka/clusterers/utils'

module Weka

  # This module contains the clusterers from the 'weka.clusterers' package.
	module Clusterers
    java_import 'weka.clusterers.SimpleKMeans'
    java_import 'weka.clusterers.FarthestFirst'
    java_import 'weka.clusterers.EM'
    java_import 'weka.clusterers.HierarchicalClusterer'
    java_import 'weka.clusterers.Cobweb'

    class Cobweb
      include Utils
      class Base < Cobweb
        def initialize(&block)
          super
          if block_given?
            init_instance_clusterer(&block)
          else
            init_clusterer
          end
        end
      end
