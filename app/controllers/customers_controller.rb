class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
  end
 
 private
  def customer_params
    params.permit(:last_name, :first_name, :last_name_kana, 
    :first_name_kana, :telephone_number, :postal_code, :address,
    :email, :password)
  end
end
