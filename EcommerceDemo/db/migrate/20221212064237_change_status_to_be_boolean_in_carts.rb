class ChangeStatusToBeBooleanInCarts < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :status, :boolean, default: false
  end
end
