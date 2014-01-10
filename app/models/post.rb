class Post < ActiveRecord::Base

  attr_accessible :published, :body, :title

  default_scope order('created_at DESC')

  scope :published, where(published: true)

end
