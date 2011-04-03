require 'rubygems'
require 'bundler'
Bundler.setup


$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

MODELS = File.join(File.dirname(__FILE__), "models")
$LOAD_PATH.unshift(MODELS)


require 'mongoid'
require 'voteable_mongoid'
require 'rspec'
require 'rspec/autorun'


Mongoid.configure do |config|
  name = "voteable_mongoid_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
  config.embedded_object_id = false
end


Dir[ File.join(MODELS, "*.rb") ].sort.each { |file| require File.basename(file) }

User.collection.drop
Post.collection.drop
Comment.collection.drop
