class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @customer = Customer.all
    @orders = Order.all
    @address = @orders.all
  end

  def edit
  end
end
