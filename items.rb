require 'sinatra'
require 'sinatra/content_for'
require 'haml'
require 'json'
require 'mongo'
require_relative 'lib/database'

get '/items' do

end

get '/cat/:id/items' do
  
end

post '/cat/:id/item' do
  
end

get '/cat/:id/item' do
  @cat = Database.new.cats.find_one(:_id => BSON::ObjectId(params[:id]))
  haml :"items/new"
end