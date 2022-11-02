class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.page(params[:page])
  end
  
  def update
    
  end
  
  def order_details_update
    
  end
end
