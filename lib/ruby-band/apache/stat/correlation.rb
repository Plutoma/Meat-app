require 'java'

module Apache
  module Stat
  	module Correlation

      java_import "org.apache.commons.math3.stat.correlation.Covariance"
      java_import "org.apache.commons.math3.stat.correlation.PearsonsCorrelation"
      java_import "org.apache.commons.math3.stat.correlation.S