class PostsController < ApplicationController
  before_filter :require_admin, except: [:index, :show]

  expose(:posts) { get_posts }
  expose(:published_posts) { Post.published }
  expose(:post, finder: :find_by_slug_or_id, attributes: :post_attributes)

  def create
    if post.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def update
    if post.save
      redirect_to :blog
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to :blog_home
  end

  private

  def get_posts
    available_posts = admin_signed_in? ? Post.all : published_posts
    available_posts.paginate(:page => params[:page], :per_page => 2)
  end

  def post_attributes
    params.require(:post).permit(
      :published,
      :body,
      :title
    )
  end
end
