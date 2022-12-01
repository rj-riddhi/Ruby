class AddUuidToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :uuid, :string
  end
end
