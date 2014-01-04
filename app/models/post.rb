class Post < ActiveRecord::Base
  attr_accessible :title, :body

  default_scope where(published: true).order('created_at DESC')

end
