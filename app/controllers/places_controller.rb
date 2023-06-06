class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"], "user_id" => session["user_id"]})
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new(params["place"])
      @place.save
    else
      flash[:notice] = "Please Login."
    end
      redirect_to "/places"
  end

end
