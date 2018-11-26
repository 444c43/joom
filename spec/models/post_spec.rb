require 'rails_helper'
require 'post'

describe Post do
  let(:post) { Post.new(title: 'A New Post', blurb: 'some small blurb') }

  describe 'creates a slug from post title' do
    it 'it sets the slug as the parameterized title' do
      post.save!
      expect(post.slug).to eq('a-new-post')
    end
  end

  context 'add tags to post' do
    describe 'existing post' do
      it 'adds a tag' do
        post.tag_list = 'one'
        post.save!

        post.reload
        expect(post.tag_list).to eq(['one'])
      end
    end
  end
end
