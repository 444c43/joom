class Post < ActiveRecord::Base
  acts_as_taggable

  default_scope -> { order(created_at: :desc) }
  scope :published, -> { where(published: true) }

  validates :title, presence: true, uniqueness: true
  validates_length_of :blurbs, maximum: 25, too_long: "must be less 50 or fewer words"

  before_save :build_slug

  def build_slug
    self.slug = title.parameterize
  end

  def self.find_by_slug_or_id(param)
    where(["slug = ? OR id = ?", param, param.to_i]).first
  end

  private

  def blurbs
   blurb.scan(/\w+/)
  end
end
