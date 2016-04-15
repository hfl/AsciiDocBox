require 'sinatra'

get '/' do
  erb :index
end

get '/write' do
  erb :write
end
