class AttractionsController < ApplicationController
  get "/destinations/:id/attractions/new" do
    @destination = Destination.find_by(id: params[:id])
    if logged_in?
      if @destination.user == current_user
        erb :"/attractions/show"
      else
        redirect to "/destinations"
      end
    else
      redirect to "/login"
    end
  end

  post "/attractions" do
    @destination = Destination.find_by(id: params[:id])
    if logged_in?
      if params[:site] == "" || params[:comments] == ""
        redirect to "/destinations/#{@destination.id}/attractions/new"
      else
        @attraction = Attraction.create(site: params[:site], comments: params[:comments])
        @destination.attractions << @attraction
        redirect to "/destinations/#{@destination.id}"
      end
    else
      redirect to "/login"
    end
  end

  get "/destinations/:destination_id/:attraction_id/edit" do
    if logged_in?
      @destination = Destination.find_by(id: params[:destination_id])
      @attraction = Attraction.find_by(id: params[:attraction_id])
      if @destination && @attraction && @destination.user == current_user && @attraction.destination_id == @destination.id
        erb :"/attractions/edit"
      else
        redirect to "/destinations"
      end
    else
      redirect to "/login"
    end
  end

  patch "/destinations/:destination_id/:attraction_id" do
    if logged_in?
      @destination = Destination.find_by(id: params[:destination_id])
      @attraction = Attraction.find_by(id: params[:attraction_id])
      if params[:site] == "" || params[:comments] == ""
        redirect to "/destinations/#{@destination.id}/#{@attraction.id}/edit"
      else
        @attraction.site = params[:site]
        @attraction.comments = params[:comments]
        @attraction.save
        redirect to "/destinations/#{@destination.id}"
      end
    else
      redirect to "/login"
    end
  end
  delete "/destinations/:destination_id/:attraction_id" do
    if logged_in?
      @destination = Destination.find_by(id: params[:destination_id])
      @attraction = Attraction.find_by(id: params[:attraction_id])
      if @destination && @attraction && @destination.user == current_user
        @attraction.delete
        redirect to "/destinations/#{@destination.id}"
      else
        redirect to "/destinations"
      end
    else
      redirect to "/login"
    end
  end
end
