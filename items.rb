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
  @items = Database.new.items.find(cat: {_id: BSON::ObjectId(params[:id])}) || []
  haml :"cats/list"
end

post '/cat/:id/item' do
  db = Database.new
  cat = db.cats.find_one _id: BSON::ObjectId(params[:id])

  item = {
    _id: BSON::ObjectId.new,
    name: params["name"],
    cat: { _id: cat["_id"], name: cat["name"] },
    fields: []
  }

  (cat["fields"] || []).each do |field|
    item["fields"] << { _id: field["_id"], name: field["name"], value: params["field_" + field["_id"]] }
  end

  db.items.insert item
  redirect "/cat/" + cat["_id"].to_s + "/items"
end

<<<<<<< HEAD
end

get '/item/:id' do
  @item = Database.new.items.find_one(_id: BSON::ObjectId(params[:id]))
    
  haml :"items/item"
=======
get '/cat/:id/item' do
  @cat = Database.new.cats.find_one(:_id => BSON::ObjectId(params[:id]))
  haml :"items/new"
>>>>>>> 6179528cc8084876dba44024e64c686e501c77ea
end