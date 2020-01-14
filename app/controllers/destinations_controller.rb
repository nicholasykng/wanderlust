class DestinationsController < ApplicationController
  get "/destinations" do
    if logged_in?
      @destinations= Destination.all
      erb :"/destinations/destinations"
    else
      redirect to "/login"
    end
  end

  get "/destinations/new" do
    if logged_in?
      erb :"/destinations/new"
    else
      redirect to "/login"
    end
  end

  post "/destinations" do
    if logged_in?
      if params[:country] == "" || params[:city] == ""
        redirect to "/destinations/new"
      else
        @destination = current_user.destinations.create(country: params[:country], city: params[:city])
        redirect to "/destinations/#{@destination.id}"
      end
    else
      redirect to "/login"
    end
  end

  get "/destinations/:id" do
    if logged_in?
      @destination = Destination.find_by_id(params[:id])
      erb :"/destinations/show"
    else
      redirect to "/login"
    end
  end
end
