class ApplicationController < ActionController::Base

  authem_for :admin
  protect_from_forgery

  expose(:recent_posts) { get_recent_posts }

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def get_recent_posts
    Post.all.published.find(2,3,4)
  end

  def deny_admin_access
    redirect_to :sign_in unless admin_signed_in?
  end
end
