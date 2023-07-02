class OrderMailer < ApplicationMailer

  def notify_customer
    @customer = params[:customer]
    @order = params[:order]
    mail(to: @customer.email, subject: 'Please collect your order.')
  end
end
