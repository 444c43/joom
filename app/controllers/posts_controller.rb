class PostsController < ApplicationController

  expose(:posts)
  expose(:post)

  def create
    if post.save
      redirect_to :posts
    end
  end

end
