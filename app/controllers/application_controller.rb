class ApplicationController < ActionController::Base
  rescue_from 'UrlGenerationError' do |exception|
    root_path()
  end

  authem_for :admin
  protect_from_forgery

  expose(:recent_posts)     { get_recent_posts }
  expose(:latest_post)      { get_latest_post }
  expose(:latest_post_path) { blog_path(latest_post) }

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def get_latest_post
    return {} if Post.published.presence == nil
    most_recent = Post.published.first
    {
      body:       most_recent.body,
      created_at: most_recent.created_at,
      id:         most_recent.id,
      published:  most_recent.published,
      slug:       most_recent.slug,
      title:      most_recent.title,
      updated_at: most_recent.updated_at,
    }
  end

  def get_recent_posts
    Post.published.order('created_at DESC').where(id: 2..4).presence || []
  end

  def deny_admin_access
    redirect_to :sign_in unless admin_signed_in?
  end
end
