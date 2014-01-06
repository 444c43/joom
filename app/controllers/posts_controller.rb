class PostsController < ApplicationController

  before_filter :require_user, except: :index

  expose(:posts)
  expose(:published_posts) { Post.published }

  expose(:post)

  def index
    @posts = signed_in? ? posts : published_posts
  end

  def create
    if post.save
      redirect_to :posts
    end
  end

  alias update create

end
