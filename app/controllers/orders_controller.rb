class OrdersController < ApplicationController
  def new#注文情報・支払方法入力画面
    @order = Order.new
    @customer = Customer.all
    @customer = current_customer
    @orders = @customer
  end

  def comfirm #注文情報確認画面　HTTPメソッド:POST
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @total = 0
    #@address = Address.find(params[:order][:address_id])
    if @oder == 0
      @order.postal_code = current_customer.postal_code
      @order.address = currentcustomer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif @order == 1
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else @order == 2
      @order = Order.new(order_params)
    end
  end
  
  def create　#注文確定処理　HTTPメソッド：POST
    @orders = Order.new(order_params)
    @orders.customer = current_customer
    @orders.save
    redirect_to orders_complete_path
  end

  def complete　#注文完了画面
    @order = Order.find(params[:id])
    @customer = current_customer
    @total = 0
  end
  

  def index　#注文履歴
  end

  def show　#注文履歴詳細画面
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :delivery_method, :cost_price, :price, :order_status, :delivery_address, :delivery_code, :delivery_name)
  end
end
