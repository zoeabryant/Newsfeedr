require 'rubygems'
require 'bundler'

Bundler.require

require './app/server'

run Sinatra::Application