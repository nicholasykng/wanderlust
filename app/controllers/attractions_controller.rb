class AttractionsController < ApplicationController
  get "/destinations/:id/attractions/new" do
    if logged_in?
      @destination = Destination.find_by(id: params[:id])
      erb :"/attractions/show"
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
    end
  end
end
