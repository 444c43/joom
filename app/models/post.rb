class Post < ActiveRecord::Base
  attr_accessible :body, :published

  default_scope where(published: true).order('created_at DESC')

end
