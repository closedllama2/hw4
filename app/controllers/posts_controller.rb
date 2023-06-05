class PostsController < ApplicationController

  def index
    @posts = Post.all.where({ user_id: session[:user_id] })
  end

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.uploaded_image.attach(params["post"]["uploaded_image"])
      @post.user_id = @current_user.id
      @post.save
    else
      flash[:notice] = "Login first."
    end
    redirect_to "/"
  end

  def destroy
  end

end
