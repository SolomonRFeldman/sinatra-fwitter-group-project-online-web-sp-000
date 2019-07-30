class UsersController < ApplicationController

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect to '/tweets'
    end
    erb :"/users/signup"
  end
  
  post '/signup' do
    if params.any? { |param| param[1] == "" }
      redirect to '/signup'
    end
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect to '/tweets'
  end
  
  get '/login' do
    erb :'/users/login'
  end
  
  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password_digest])
  end
  
    
end
