class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_items, dependent: :destroy, inverse_of: :order
  has_many :items, through: :ordered_items

  scope :latest, -> { order('created_at DESC') }
  accepts_nested_attributes_for :ordered_items, allow_destroy: true,
    reject_if: proc { |att|
      att['item_id'].blank? && att['_destroy'] == "false"
    }
  enum order_status: { created: 0, paid: 1, notify: 2 }
  after_save :calculate_order_cost
  after_save :notify_customer, if: ->(obj){
    obj.saved_change_to_order_status? && obj.notify?
  }
  after_validation :calculate_order_cost
  validates :order_status, :user_id, presence: true

  def calculate_order_cost
    self.final_total = ordered_items_cost
  end

  def items_list
    items.pluck(:name).join(', ')
  end

  def notify_customer
    OrderMailer.with(customer: user, order: self).notify_customer.deliver_now
  end

  private

  def ordered_items_cost
    total_cost = 0
    ordered_items.each do |ordered_item|
      offer = ordered_item.offer
      cost = offer&.item_price || (ordered_item.quantity * ordered_item.item.item_price)
      total_cost += cost
    end
    total_cost
  end
end
