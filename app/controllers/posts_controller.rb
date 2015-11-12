class PostsController < ApplicationController
  before_filter :require_admin, except: [:index, :show]

  expose(:posts)
  expose(:published_posts) { Post.published }
  expose(:post, finder: :find_by_slug_or_id, attributes: :post_attributes)

  def index
    @posts = admin_signed_in? ? posts : published_posts
  end

  def create
    if post.save
      redirect_to :blog_home
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

  def post_attributes
    params.require(:post).permit(
      :published,
      :body,
      :title
    )
  end
end
