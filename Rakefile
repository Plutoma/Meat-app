# encoding: utf-8
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
  require 'jbundler'
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `jruby -S bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygem