class PlacesController < ApplicationController

  def index
    @places = Place.all.where({ user_id: session[:user_id] })
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"], "user_id" => session["user_id"]})
  end

  def new
    @place = Place.new
    @place.user_id = params["user_id"]
  end

  def create
    if @current_user
      @place = Place.new(params["place"])
      @place.user_id = @current_user.id
      @place.save
    else
      flash[:notice] = "Please Login."
    end
      redirect_to "/places"
  end

end
