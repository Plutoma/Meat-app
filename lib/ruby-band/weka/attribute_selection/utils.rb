module Weka
  module AttributeSelection
    module Utils
      java_import "weka.core.Utils"

      # Instance methods list
      def options_list
        listOptions.map {|key| "#{key.synopsis} #{key.description}"}.join("\n")
      end

      # Set options for an evaluator or a search algorithm
      def select_options(opti