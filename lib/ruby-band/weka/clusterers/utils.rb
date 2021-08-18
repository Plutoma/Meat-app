module Weka
  module Clusterers

    # This module is used by the classes from the Clusterers module
    # to inherit the following methods (instance and class methods)
    module Utils
      java_import "weka.core.Utils"
      java_import "weka.clusterers.ClusterEvaluation"

      def init_clusterer
        set_options(self.class.options) if self.class.options
        buildClusterer(self.class.data)
      end

      def init_instance_clusterer(&block)
        self.instance_eval(&block)
        #@dataset.setClassIndex(@class_index)
        buildClusterer(@dataset)
      end

      #Instance methods list
      def self.included(base)
        base.extend(ClassMethods)
      end

      #set instance data for the clusterer
      def set_data(data)
        @dataset = data
      end

      #set options for the clusterer
      def set_options(options)
        options_inst = Utils.splitOptions(options)
        setOptions(options_inst)
      end

      def list_options
        listOptions.map {|key| "#{key.synopsis} #{key.description}"}.join("\n")
      end

      #the description provided by the Weka Documentation
      def description
        globalInfo
      end

      #list cluster centroids with coordinates
      def get_centroids
        getClusterCentroids
      end

      #list cluster's capabilities with attribu