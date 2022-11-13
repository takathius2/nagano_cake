class Public::SessionsController < Devise::SessionsController
    
  #ログインのcreateアクションの前に顧客が退会しているか確認
   before_action :customer_state, only: [:create]
   protected
   def customer_state
    #入力されたemailからアカウントを1件特定
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    #特定したパスワードとログイン画面のが一致しているか確認
     if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
         flash[:error] = "退会済みです。新規登録を行ってください。"
         redirect_to new_customer_registration_path
     end
   
   end
end