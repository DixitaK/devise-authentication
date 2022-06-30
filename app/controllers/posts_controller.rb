class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post).order(created_at: :desc)
    authorize @posts
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end  
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy

    authorize @post
    redirect_to posts_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
