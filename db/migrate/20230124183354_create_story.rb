class CreateStory < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.string :by
      t.string :title
      t.string :url
      t.float :likes
      t.time :time
      t.timestamps
    end
  end
end
