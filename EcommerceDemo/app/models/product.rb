class Product < ApplicationRecord
    
  mount_uploader :image, ProductImageUploader

  # serialize :image, JSON

  belongs_to :user, optional: true
  validates :name, :description, :condition, :price, :image, presence: true
  validates :price, length: {maximum: 7 }

  CONDITION = %w{ New Excellent Mint Used Failr Poor}

end
