require './config/environment'
require './app/models/pref'
require './app/models/user'
require 'pry'
require './app/models/twilio'
require 'twilio-ruby'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'flatiron'
  end
 
  helpers do
    def signed_in?
      session[:user_id]
    end
    
    def current_user
      current_user = User.find(session[:user_id])
    end
    
  end
  
  get '/' do
     @user = User.find_by(:id => session[:user_id]) 
    if @user 
      erb :index
    else
      redirect '/login'
    end
  end


  get '/signout' do
   session[:user_id] = nil
   session[:error] = nil
   redirect "/login"
  end
  
  get '/sign-up' do
    @signin_page = true
    erb :signup
  end
  
  
  get '/login' do
    @signin_page = true
    erb :login
  end
  
  get '/pref' do
    @user = User.find_by(:id => session[:user_id]) 
      if @user 
        erb :pref
      else
        redirect '/login'
      end
    end
 

  post '/sign-up' do
    @user = User.create(:name => params[:name], :number => params[:number])
    @signin_page = true
    redirect '/'
  end
  
  post '/pref' do
    @pref = Pref.create(:weather => params[:weather], :youtube => params[:youtube])
    @weather = "weather"
    @youtube = 
    redirect '/'
    end
  
  post '/text' do
    if
    number = session[:number]
    send_sms(number)
    end
    redirect '/'
  end
  
  
  post '/login' do
    @user = User.find_by(:name => params[:name], :number => params[:number]) 
      if @user
        session[:user_id] = @user.id
        session[:number] = @user.number.to_i
        redirect '/'
      else
        redirect '/sign-up'
      end
    end

end

