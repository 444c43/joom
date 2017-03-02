class PostsController < ApplicationController
  before_filter :require_admin, except: [:show]

  expose(:posts) { all_posts }
  expose(:published_posts) { Post.published.presence || [] }
  expose(:post, finder: :find_by_slug_or_id, attributes: :post_attributes)

  def create
    post.save ? redirect_to(root_path) : render(:new)
  end

  def update
    post.save ? redirect_to(root_path) : render(:edit)
  end

  def destroy
    post.destroy!
    redirect_to :root 
  end

  private

  def all_posts
    available_posts = admin_signed_in? ? Post.all : published_posts
    paginate(available_posts)
  end

  def paginate(available_posts)
    available_posts.paginate(page: params[:page], per_page: 2)
  end

  def post_attributes
    params.require(:post).permit(:published, :body, :title)
  end
end
