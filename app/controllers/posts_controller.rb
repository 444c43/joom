class PostsController < ApplicationController

  before_filter :require_user, except: [:index, :show]

  expose(:posts)
  expose(:published_posts) { Post.published }

  expose(:post, finder: :find_by_slug_or_id)

  def index
    @posts = signed_in? ? posts : published_posts
  end

  def create
    if post.save
      redirect_to :blog
    end
  end

  alias update create

  def destroy
    post.destroy
    redirect_to :blog
  end

end
