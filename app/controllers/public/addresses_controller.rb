class Public::AddressesController < ApplicationController
  def index
    @address_new = Address.new
    @addresses = current_customer.addresses.all
  end
  
  def create
    @address_new = Address.new(address_params)
    @address_new.customer_id = current_customer.id
    @address_new.save
    redirect_to addresses_path
  end
  
  def update
  end

  def edit
  end
  
  
  def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    redirect_to addresses_path
  end
  
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
