require 'sinatra'
require 'sinatra/content_for'
require 'haml'
require 'json'
require 'mongo'
require_relative 'lib/database'

get '/items' do
  @items = Database.new.items.find || []
  haml :"cats/list"
end

get '/cat/:id/items' do
  @items = Database.new.items.find(category_id: BSON::ObjectId(params[:id]) || []
  haml :"cats/list"
end

post '/cat/:id/item' do
  
end

post '/item/:id' do

end