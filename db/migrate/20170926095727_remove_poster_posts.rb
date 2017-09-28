# Remove poster column from posts
class RemovePosterPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :poster
  end
end
