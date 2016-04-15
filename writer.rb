require 'sinatra'
require 'tilt/erubis'
require 'sequel'
require 'sqlite3'

DB = Sequel.connect('sqlite://database/workings.sqlite')

# models

class Article < Sequel::Model
end

# controllers and views

get '/' do
  @articles = Article.all
  erb :index
end

get '/list' do
  'archives'
end

get '/show/:id' do
  @article = Article[params['id']]
  erb :show
end

get '/write' do
  erb :write
end

post '/save' do
  @article = Article.new(:title => params[:title], :asciidoc_content => params[:asciidoc_content], :html_content => params[:asciidoc_content], :created_at => Time.now, :updated_at => Time.now )

  if @article.save
    redirect to '/show/#{@article.id}'
  else
    redirect back
  end
end

get '/edit/:id' do
  "Edit"
end

put '/update' do
  "Update"
end

delete '/delete' do
  'delete'
end
