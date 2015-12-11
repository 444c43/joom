class ApplicationController < ActionController::Base

  authem_for :admin
  protect_from_forgery

  expose(:recent_posts) { get_recent_posts }
  expose(:latest_post) { get_latest_post }

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def get_latest_post
    Post.published.first
  end

  def get_recent_posts
    Post.published.order('created_at DESC').where(id: 2..4)
  end

  def deny_admin_access
    redirect_to :sign_in unless admin_signed_in?
  end
end
