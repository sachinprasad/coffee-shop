class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  belongs_to :offer, optional: true

  validates :order_id, :item_id, presence: true

  def get_quantity
    self.quantity || 1
  end
end
