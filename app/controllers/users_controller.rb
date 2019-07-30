class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end
  
  post '/signup' do
    if params[:user].any? { |param| param[1] == "" }
      redirect to '/signup'
    end
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect to '/tweets'
  end
    
end
