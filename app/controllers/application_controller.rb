
require './config/environment'
require './app/models/tweet'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

    erb :index
  end


end