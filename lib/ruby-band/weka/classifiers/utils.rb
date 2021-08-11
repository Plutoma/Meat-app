module Weka
  module Classifiers

    # This module is used by the classifiers to inherit the following methods (instance and class methods).
    module Utils
      java_import "weka.core.Utils"

      def init_classifier
        set_options(self.class.options) if self.class.options
        self.class.data.setClassIndex(self.class.class_index) if self.class.class_index
        buildClassifier(self.class.data)
      end

      # Instance methods list
      def self.included(base)
        base.extend(ClassMethods)
      end

      def init_instance_classifier(&block)
        self.instance_eval(&block)
        @dataset.setClassIndex(@class_in