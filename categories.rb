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

get '/cat' do
  haml :"cats/new_cat"
end

post '/cat' do
  cat = {id: BSON::ObjectId.new, name: params[:name]}
  Database.new.cats.insert cat
  redirect '/cat/' + cat[:id].to_s
end

post '/cat/:id/field' do

end