# change like format to integer
class ChangeLikerFormatInLikes < ActiveRecord::Migration[5.1]
  def change
    change_column :likes, :liker, :integer
  end
end
