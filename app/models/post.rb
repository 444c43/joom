class Post < ActiveRecord::Base

  attr_accessible :published, :body, :title

  default_scope order('created_at DESC')

  scope :published, where(published: true)

  validates :title, presence: true

  before_save :create_slug

  def build_slug
    self.slug = title.parameterize
  end

end
