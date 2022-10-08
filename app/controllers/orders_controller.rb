class OrdersController < ApplicationController
  def new　#注文情報・支払方法入力画面
    @order = Order.new
    @customer = Customer.all
    @customer = current_customer
    @orders = @customer
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
  end
  
  def comfirm #注文情報確認画面　HTTPメソッド:POST
  end

  def index　#注文履歴
  end

  def show　#注文履歴詳細画面
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :cost_praice, :price)
  end
end
