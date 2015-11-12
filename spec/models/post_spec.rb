require 'active_record_helper'
require 'post'

describe Post do
  it "requires a title" do
    expect(Post.new).to have(1).error_on(:title)
  end

  it "requires unique title" do
    Post.create(title: 'A Unique Title')
    expect(Post.new(title: 'A Unique Title')).to have(1).errors_on(:title)
  end

  describe "#build_slug" do
    it "it sets the slug as the parameterized title" do
      post = Post.new(title: '2toneDL')
      post.build_slug
      expect(post.slug).to eq('2toneDL')
    end
  end
end
