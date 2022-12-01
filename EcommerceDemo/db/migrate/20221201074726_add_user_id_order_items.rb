class AddUserIdOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :user_id, :integer
  end
end
