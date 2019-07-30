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
      erb :'/tweets/new'
    else
      redirect '/login'
    end
  end
  
  post '/tweets' do
    if params[:content] == ""
      redirect '/tweets/new'
    else
      binding.pry
      @user = User.find(session[:user_id])
      @user.tweets << Tweet.new(params)
      @user.save
      binding.pry
      redirect '/tweets'
    end
  end
  
end
