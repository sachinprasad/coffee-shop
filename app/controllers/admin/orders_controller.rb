class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: %i[ edit update update_order_status destroy ]
  before_action :set_item, only: %i[ edit update ]

  def index
    @orders = Order.latest
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to admin_orders_url, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok }
      else
        debugger
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_order_status
    message = if @order.update(order_status: params[:status])
                "Order status updated to #{params[:status]}."
              else
                'Some error occured.Try again.'
              end
    redirect_to admin_orders_path(@order), notice: message
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_item
      @items = Item.all
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(ordered_items_attributes: [:id, :item_id, :offer_id, :quantity, :_destroy])
    end
end
