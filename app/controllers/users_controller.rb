class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end
  
  post '/users' do
    User.create(params)
    
    
end
