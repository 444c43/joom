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

  context 'add tags to post' do
    describe "existing post" do
      it "adds a tag" do
        post = create :post
        post.tag_list.add("one")
        post.save!

        post.reload

        expect(post.tag_list).to eq(["one"])
      end
    end

    describe "new post" do
      it "adds a tag" do
        post = create :post, tag_list: ["one"]

        post.reload

        expect(post.tag_list).to eq(["one"])
      end
    end
  end
end
