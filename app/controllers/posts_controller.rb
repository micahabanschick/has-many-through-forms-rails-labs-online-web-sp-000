class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # @comment = @post.comments.build
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # if post_params[:categories_attributes][:name].empty?
    #   post_params = post_params.remove(categories_attributes)
    # end
    # post = Post.create(post_params)
    if !params[:post][:categories_attributes][:name].empty?
      post = Post.create(post_params(:title, :content, category_ids:[], categories_attributes: [:name]))
    else
      post = Post.create(post_params(:title, :content, category_ids:[]))
    end
    redirect_to post
  end

  private

  def post_params(*args)
    # params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
    params.require(:post).permit(*args)
  end
end
