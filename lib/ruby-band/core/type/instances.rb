require 'java'
require 'ruport'
require 'json'

module Core

  java_import "weka.core.SerializationHelper"
  module Type
    
    java_import "weka.core.Instances"
    java_import 'java.io.File'
    java_import 'weka.core.converters.CSVSaver'
    java_import 'weka.core.converters.ArffSaver'
    java_import "weka.core.FastVector"
    java_import "weka.core.DenseInstance"

    #
    # * *Description*    :
    # This is the main class from the Weka package for data handling. It is essentially a matrix: each row
    # is an instance of the 'Instance' class, while each column is an instance of the 'Attribute' class
    # The class 'Instances' is here extended to add custom functionalities 
    class Instances

      # Convert an Instances object to a bidimensional Ruby array
      # where each row corresponds to an Instance object
      def to_a2d
        matrix = Array.new
        att = Array.new
        self.enumerateAttributes.each_with_index do |a,idx|
          if a.isNumeric  
            enumerate_instances.each {|s| att << s.value(s.attribute(idx))}
            matrix << att
            att = Array.new
          else
            enumerateInstances.each do |inst|
              att << inst.string_value(idx)
            end
            matrix << att
            att = Array.new
          end
        end
        return matrix.transpose
      end

      # Return the number of rows (Instance objects) in the dataset
      def n_rows
        return numInstances
      end

      # Return the number of columns (Attribute objects) in the dataset
      def n_col
        return numAttributes
      end

      # Return the dimensions of the dataset (for the current Instances class object)
      def dim
        puts "Rows number:\t#{numInstances}\nColumns number:\t #{numAttributes}"
      end

      def each_row
        enumerate_instances.each {|inst| yield(inst)}
      end

      def each_row_with_index
        enumerate_instances.each_with_index {|inst,id| yield(inst,id)}
      end

      def each_column
        enumerate_attributes.each {|attribute| yield(attribute)}
      end

      def each_column_with_index
        enumerate_attributes.each_with_index {|attribute,id| yield(attribute,id)}
      end

      # Check if this instance's attributes are all Numeric
      def check_numeric_instance
        enumerateAttributes.each do |att|
          unless att.isNumeric
            raise ArgumentError, "Sorry, attribute '#{att.name}' is not numeric!"
          end
        end
      end

      # Convert the present Instances object to an Apache matrix if every Instances attribute
      # is Numeric 
      def to_Apache_matrix
        check_numeric_instance
        ruby_array = to_a
        java_double_array = Core::Utils::bidimensional_to_double(ruby_array)
        return Core::Type::Apache_matrix.new(java_double_array)
      end

      # Convert the present Instances object to an Apache matrix (block) if every Instances attribute
      # is Numeric 
      def to_Apache_matrix_block
        check_numeric_instance
        ruby_array = to_a
        java_double_array = Core::Utils::bidimensional_to_double(ruby_array)
        return Core::Type::Apache_matrix_block.new(java_double_array)
      end

      # Return data for a single attribute (a column from the Instances object)
      # * *Args*    :
      #   - +att+ -> a String, the name of the attribute
      def return_attr_data(att)
        attr_values = Array.new
        if attribute(att).isNumeric
          enumerateInstances.each do |i|
            attr_values << i.value(attribute(att))
          end
        