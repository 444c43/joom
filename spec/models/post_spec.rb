require 'spec_helper'
require 'post'

describe Post do
  describe "#build_slug" do
    it "it sets the slug as the parameterized title" do
      post = Post.new(title: 'A New Post')
      post.build_slug
      expect(post.slug).to eq('a-new-post')
    end
  end
end
