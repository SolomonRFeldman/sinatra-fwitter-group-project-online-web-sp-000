class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end
  
  post '/users' do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect to "/tweets"
  end
    
end
