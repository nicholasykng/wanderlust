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
      @attractions = @destination.attractions
      erb :"/destinations/show"
    else
      redirect to "/login"
    end
  end

  get "/destinations/:id/edit"do
    if logged_in?
      @destination = Destination.find_by_id(params[:id])
      if @destination && @destination.user == current_user
        erb :"/destinations/edit"
      else
        redirect to "/destinations"
      end
    else
      redirect to "/login"
    end
  end

  patch "/destinations/:id" do
    if logged_in?
      if params[:city] == "" || params[:country] == ""
        redirect to "/destinations/#{params[:id]}/edit"
      else
        @destination= Destination.find_by_id(params[:id])
        if @destination && @destination.user == current_user
          @destination.country = params[:country]
          @destination.city = params[:city]
          @destination.save
          redirect to "/destinations/#{@destination.id}"
        else
          redirect to "/destinations"
        end
      end
    else
      redirect to "/login"
    end
  end

  delete "/destinations/:id" do
    if logged_in?
      @destination = Destination.find_by_id(params[:id])
      if @destination && @destination.user == current_user
        @destination.delete
        redirect to "/destinations"
      else
        redirect to "/destinations"
      end
    else
      redirect to "/login"
    end
  end

end
