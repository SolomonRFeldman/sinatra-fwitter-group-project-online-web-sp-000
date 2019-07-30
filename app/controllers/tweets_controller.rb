class TweetsController < ApplicationController

  get '/tweets' do
    @user = User.find(session[:user_id])
    binding.pry
    erb :'/tweets/index'
  end
  
end
