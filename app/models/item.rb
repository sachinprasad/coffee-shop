class Item < ApplicationRecord
  belongs_to :user

  has_many :offers, dependent: :destroy
  # belongs_to :offer_item, class_name: "Item", foreign_key: "parent_id", optional: true
  scope :by_name, -> { order(:name) }
  # scope :primary_items, -> { where("parent_id is null") }

  validates :user_id, :name, :price, :tax_rate, presence: true

  def item_price
    tax + price
  end

  def tax
    return 0 if tax_rate.to_f <= 0

    (tax_rate / 100) * price
  end
end
