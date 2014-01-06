class PostsController < ApplicationController

  before_filter :require_user, except: :index

  expose(:posts)
  expose(:post)

  def create
    if post.save
      redirect_to :posts
    end
  end

end
