class ChangeColumnMesaagesToComment < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :messages, :text
  end
end
