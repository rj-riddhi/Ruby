class AddUserIdToUserLists < ActiveRecord::Migration[7.0]
  def change
    add_column :user_lists, :user_id, :integer
    add_index :user_lists, :user_id
  end
end
