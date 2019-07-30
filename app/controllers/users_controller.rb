class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end
  
  post '/users' do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect "/tweets"
  end
    
end
