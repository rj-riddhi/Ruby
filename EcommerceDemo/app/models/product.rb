class Product < ApplicationRecord
    
  mount_uploader :image, ProductImageUploader

  # serialize :image, JSON
  before_destroy :not_referenced_by_any_order_item
  belongs_to :user, optional: true
  has_many :order_items
  validates :name, :description, :condition, :price, :image, presence: true
  validates :price, length: {maximum: 7 }

  CONDITION = %w{ New Excellent Mint Used Failr Poor}

  def not_referenced_by_any_order_item
    unless order_items.empty?
      errors.add(:base, "Order Items present")
      throw :abort
    end
  end

end
