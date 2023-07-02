module ApplicationHelper

  def format_item_offer item
    item.is_free? ? "Free" : "Discount: #{item.discount_percent}%"
  end

  def ordered_item order, item_id, offer_id=nil
    items = order.ordered_items
    return if order.ordered_items.blank?

    items.find{|i| i[:item_id] == item_id && i[:offer_id] == offer_id }
  end

  def disable_status admin_order, status
    if status == 'notify' && !['created', 'paid'].include?(admin_order.order_status)
      'disabled'
    elsif status == 'paid' && admin_order.order_status != 'created'
       'disabled'
    end
  end

  def quantity ordered_item
    ordered_item&.quantity || 1
  end
end
