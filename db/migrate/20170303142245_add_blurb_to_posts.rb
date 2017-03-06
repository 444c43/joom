class AddBlurbToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :blurb, :string, limit: 50
  end
end
