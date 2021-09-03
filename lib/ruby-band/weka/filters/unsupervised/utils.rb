module Weka
  module Filters
    module Unsupervised
      module Utils
        java_import "weka.core.Utils"
        java_import "weka.filters.Filter"

        # Instance methods list
        def options_list
          listOptions.map { |key| "#{key.synopsis} #{key.description}" }.join("\n")
        end

        def filter_options(options_string)
          options = Utils.splitOptions(options_string)
          setOptions(options)
        end

        def data(instances)
          setInputFormat(instances)
          @input = instances
        end

        def description
          globalInfo
        en