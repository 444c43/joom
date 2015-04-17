class Post < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :published, :body, :title
  default_scope order('created_at DESC')
  scope :published, where(published: true)

  validates :title, presence: true, uniqueness: true

  before_save :build_slug

  def build_slug
    self.slug = title.parameterize
  end

  def self.find_by_slug_or_id(param)
    where(["slug = ? OR id = ?", param, param.to_i]).first
  end

end
