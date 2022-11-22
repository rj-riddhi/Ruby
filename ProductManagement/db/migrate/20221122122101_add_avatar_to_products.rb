class AddAvatarToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :avatar, :string
  end
end
