require 'sinatra'

require_relative 'controllers/application'

set :views, Proc.new { File.join(root, "views") }
set :public_dir, Proc.new { File.join(root, "..", "public") }