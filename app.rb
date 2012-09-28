require 'sinatra'
require 'sinatra/content_for'
require 'haml'
require 'json'
require 'mongo'
require_relative 'lib/database'

require_relative 'categories'

get '/' do
  Database.new.items.find
end