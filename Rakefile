require "rubygems"
require "bundler"
Bundler.setup

#
# The rspec tasks
#
require 'rspec/core'
require 'rspec/core/rake_task'
task :default => :spec
RSpec::Core::RakeTask.new(:spec)

#
# Jeweler
#
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "permoid"
    gemspec.summary = "Permalinkd for Mongoid"
    gemspec.description = "Add permalinks to your mongoid models"
    gemspec.email = "42@dmathieu.com"
    gemspec.homepage = "http://github.com/dmathieu/permoid"
    gemspec.authors = ["Damien MATHIEU"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

#
# SDoc
#
begin
  require 'sdoc_helpers'
rescue LoadError
  puts "sdoc support not enabled. Please gem install sdoc-helpers."
end

