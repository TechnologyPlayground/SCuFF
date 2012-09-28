require 'sinatra'
require 'sinatra/content_for'
require 'haml'
require 'json'
require 'mongo'
require_relative 'lib/database'

require_relative 'categories'
require_relative 'items'

configure do
  set :title, "Awesome Items!"
end

get '/' do

end