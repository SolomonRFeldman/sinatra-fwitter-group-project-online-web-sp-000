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
      @user = User.find(session[:user_id])
      @user.tweets << Tweet.create(content: params[:content])
      @user.save
      redirect '/tweets'
    end
  end
  
  get '/tweets/:id' do
    if Helpers.is_logged_in?(session)
      @tweet = Tweet.find(params)
      binding.pry
      erb :'/tweets/show'
    else
      redirect '/login'
    end
  end
  
  get '/tweets/:id/edit' do
    @tweet = Tweet.find(id: params[:id])
    if @tweet.user.id == session[:user_id]
      erb :'/tweets/edit'
    else
      redirect '/login'
    end
  end
  
  patch '/tweets/:id' do
    @tweet = Tweet.find(id: params[:id])
    @tweet.update(content: params[:content])
    redirect "/tweets/#{params[:id]}"
  end
  
  delete '/tweets/:id' do
    Tweet.find(id: params[:id]).destroy
    redirect '/tweets'
  end
  
  
end
