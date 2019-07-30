class UsersController < ApplicationController

  get '/signup' do
    if Helper
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
    
end
