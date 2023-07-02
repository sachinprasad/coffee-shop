class Offer < ApplicationRecord
  belongs_to :discounted_item, foreign_key: 'discounted_item_id', class_name: 'Item'
  belongs_to :item

  validates :discounted_item_id, :item_id, presence: true
  validates :is_free, presence: true, unless: :discount_percent
  validates :discount_percent, presence: true, unless: :is_free

  def item_price
    return 0 if is_free?

    price_with_tax = discounted_item.item_price
    price_with_tax - calc_discount(price_with_tax)
  end

  def calc_discount(amount)
    return 0 if discount_percent.to_f <= 0

    (discount_percent / 100) * amount
  end
end
