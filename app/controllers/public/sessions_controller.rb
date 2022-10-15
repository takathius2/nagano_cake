# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  #ログインのcreateアクションの前に顧客が退会しているか確認
   before_action :customer_state, only: [:create]
   protected
   def customer_state
  #入力されたemailからアカウントを特定
     @customer = Customer.find_by(email: params[:customer][:email])
     return if !@customer
  #特定したパスワードとログイン画面のが一致しているか確認
     if @customer.valid_password?(params[:customer][:password])
       true && !false
       redirect_to customers_my_page_path
     else
       redirect_to new_customer_session_path
     end
   end
end
