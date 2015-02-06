require 'sinatra'
require './lib/rss_handler'
require 'bundler/setup'

require_relative 'controllers/application'

set :views, Proc.new { File.join(root, "app/views") }
set :public_dir, Proc.new { File.join(root, "..", "public") }