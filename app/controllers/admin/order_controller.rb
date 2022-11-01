class Admin::OrderController < ApplicationController
  def show
    @orders = Order.page(params[:page])
  end
  
  def update
    
  end
  
  def order_details_update
    
  end
end
