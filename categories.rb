require 'sinatra'
require 'sinatra/content_for'
require 'haml'
require 'json'
require 'mongo'
require_relative 'lib/database'

get '/cats' do
  @cats = Database.new.cats.find || []
  haml :"cats/list"
end

get '/cat' do
  haml :"cats/new_cat"
end

post '/cat' do
  cat = {_id: BSON::ObjectId.new, name: params[:name]}
  Database.new.cats.insert cat
  redirect '/cat/' + cat[:_id].to_s
end

get '/cat/:id' do
  @cat = Database.new.cats.find(:"cats._id" => BSON::ObjectId(params[:id]))
  #@cat = { :name => "Nerf" }
  
  haml :"cats/cat"
end

post '/cat/:id' do
  field = {_id: BSON::ObjectId.new, name: params[:name]}
  
  cat = Database.new.cats.find(:_id => BSON::ObjectId(params[:id]))
  cat[:fields] << field
  
  redirect '/cat/' + params[:id]
end

post '/cat/:id/field' do
  Database.new.cats.find
end