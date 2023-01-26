class ChangeColumnLikeToStory < ActiveRecord::Migration[7.0]
  def change
    change_column :stories, :likes, :integer
  end
end
