class SessionsController < ApplicationController

  expose(:admin) { Admin.where(email: params[:email].downcase).first }
  expose(:posts) { get_posts }
  expose(:published_posts) { Post.published }

  def create
    if admin && admin.authenticate(params[:password])
      sign_in(admin, remember: params[:remember])
      redirect_to :root
    else
      redirect_to :sign_in
    end
  end

  def destroy
    sign_out_admin
    redirect_to root_path
  end

  private

  def get_posts
    admin_signed_in? ? Post.all : published_posts
  end
end
