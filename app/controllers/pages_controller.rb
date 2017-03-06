class PagesController < ApplicationController
  expose(:posts)            { show_posts             }
  expose(:about)            { load_markdown "about"  }
  expose(:intro)            { load_markdown "intro"  }
  expose(:issues)           { load_markdown "issues" }
  expose(:topic)            { params[:topic]         }
  expose(:latest)           { latest_post            }
  expose(:latest_post_path) { latest_post_path       }
  expose(:recent)           { recent_posts           }

  private

  def load_markdown(page_name)
    File.read("#{Rails.root}/app/views/pages/markdown/#{page_name}.md")
  end

  def show_posts
    available_posts = Post.published.tagged_with params[:topic]
    paginate(available_posts)
  end

  def latest_post
    return {} if Post.published.presence.nil?
    Post.published.first
  end

  def latest_post_path
    return root_path if latest_post.empty?
    latest_post[:slug]
  end

  def recent_posts
    Post.published.order("created_at DESC").offset(1).first(limit = 3)
  end

  def paginate(available_posts)
    available_posts.paginate(page: params[:page], per_page: 2)
  end
end
