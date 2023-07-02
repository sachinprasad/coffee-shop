class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_item, only: %i[ new edit update create ]

  def index
    @orders = current_user.orders.latest
  end

  def new
    @order = current_user.orders.new
  end

  def edit
  end

  def create
    @order = current_user.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_url, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_url, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        debugger
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
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
