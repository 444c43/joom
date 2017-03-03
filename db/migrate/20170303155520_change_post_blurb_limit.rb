class ChangePostBlurbLimit < ActiveRecord::Migration
  def change
    change_column :posts, :blurb, :string, :limit => nil
  end
end
