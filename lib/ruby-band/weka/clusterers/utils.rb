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
        #@dataset.setClassIndex(@class