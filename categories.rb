require 'sinatra'
require 'sinatra/content_for'
require 'haml'
require 'json'
require 'mongo'
require_relative 'lib/database'

get '/cats' do
  @cats = cats.find || []
  haml :"cats/list"
end

get '/cat/:id' do

end

get '/cat' do
  haml :"cats/new_cat"
end

post '/cat' do
  cat = {_id: BSON::ObjectId.new, name: params[:name]}
  Database.new.cats.insert cat
  redirect '/cat/' + cat[:_id].to_s
end

post '/cat/:id/field' do
  Database.new.cats.find
end