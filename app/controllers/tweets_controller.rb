class TweetsController < ApplicationController

  get '/tweets' do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      erb :'/tweets/index'
    else
      redirect '/login'
    end
  end
  
  get '/tweets/new' do
    if Helpers.is_logged_in?(session)
      erb :'/tweets/index'
    else
      redirect '/login'
    end
  end
  
  post '/tweets' do
    User
  end
  
end
