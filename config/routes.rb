Rails.application.routes.draw do
    scope module: :public do
      root to: 'homes#top'
      get '/about' => 'homes#about'
      
      #顧客のページ関連
      get '/customers/my_page' => 'customers#show'
      get '/customers/infomation/edit' => 'customers#edit'
      patch '/customers/infomation/up_date' => 'customers#update'
      get '/customers/unsubscribe' => 'customers#unsubscribe'
      patch '/customers/withdraw' => 'customers#withdraw'
      
      #商品関連
      resources :items, only: [:index, :show]
      
      #注文関連
     
      post '/orders/comfirm' => 'orders#comfirm'
      get '/orders/complete' => 'orders#complete'
      post '/orders' => 'orders#create'
      resources :orders, only: [:new, :index, :show]
      #カート関連
      delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
      resources :cart_items, only: [:index, :update, :destroy, :create]
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
      
    end
    #顧客情報関連
    devise_for :customers,skip: [:passwords], controllers: {
        registrations: "public/registrations",
        sessions: 'public/sessions'
    }
   
    
   #管理者情報関連
    devise_for :admin, skip:[:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }
    
    namespace :admin do
      get '/' => 'homes#top'
      resources :items, only: [:new, :create, :index, :show, :edit, :update]
      resources :genres, only: [:index, :edit, :create, :update]
      resources :customers, only: [:index, :show, :edit, :update]
      patch '/customers' => 'customer#update'
      patch '/order_details' => 'order_detail#update'
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end