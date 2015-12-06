class PagesController < ApplicationController

  expose(:admin) { Admin.where(email: params[:email].downcase).first }
  expose(:recent_posts) { get_recent_posts }
  expose(:posts) { get_posts }
  expose(:published_posts) { Post.published }

  def about
  end

private

  def get_posts
    admin_signed_in? ? Post.all : published_posts
  end

  def get_recent_posts
    Post.all.published.limit(3)
  end

end
