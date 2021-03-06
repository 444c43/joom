class PostsController < ApplicationController
  before_filter :require_admin, except: [:show]

  expose(:posts) { all_posts }
  expose(:topics) { topics }
  expose(:published_posts) { Post.published.presence || [] }
  expose(:post, finder: :find_by_slug_or_id, attributes: :post_attributes)

  def create
    post.tag_list.add(params["tag"]["name"])
    post.save ? redirect : error_and_retry(:new)
  end

  def update
    update_post_tag unless post.tag_list.first == params["tag"]["name"]
    post.save ? redirect : error_and_retry(:edit)
  end

  def destroy
    post.destroy!
    redirect_to :root 
  end

  private

  def topics
    topic_list = ActsAsTaggableOn::Tag.all.order(:name).map { |tag| tag.name }
    tag = post.tag_list.first
    return topic_list if tag.nil?
    topic_list.delete  tag
    topic_list.unshift tag
  end

  def error_and_retry(action)
    flash[:notice] = post.errors.messages
    render(action)
  end

  def redirect
    flash.clear if flash
    redirect_to root_path
  end

  def update_post_tag
    post.tag_list = []
    post.tag_list.add(params["tag"]["name"])
  end

  def all_posts
    available_posts = admin_signed_in? ? Post.all : published_posts
    paginate(available_posts)
  end

  def paginate(available_posts)
    available_posts.paginate(page: params[:page], per_page: 2)
  end

  def post_attributes
    params.require(:post).permit(:published, :body, :blurb, :title, :tag_list)
  end
end
