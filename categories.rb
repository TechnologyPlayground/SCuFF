require 'sinatra'
require 'sinatra/content_for'
require 'haml'
require 'json'
require 'mongo'
require_relative 'lib/database'

get '/cats' do

end

get '/cat/:id' do
  #@cat = Database.new.cats.find params[:id]
  @cat = { :name => "Nerf" }
  
  haml :"cats/cat"
end

post '/cat' do

end

post '/cat/:id/field' do

end