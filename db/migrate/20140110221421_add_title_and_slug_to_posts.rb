class AddTitleAndSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :slug, :string
  end
end
