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
    
end
