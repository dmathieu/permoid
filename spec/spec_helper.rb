require 'mongoid'
require 'permoid'

require 'rspec'
require 'mocha'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new('127.0.0.1', 27017).db('permoid_test')
end
