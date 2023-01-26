class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :story, foreign_key: true
      t.string :messages
      t.string :user
      t.references :parent, optional: true
      t.timestamps
    end
  end
end
