class UsersController < ApplicationController
  get "/signups" do
    erb :"/users/create_user"
  end

  post "/signups" do
    
  end
end
