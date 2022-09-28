Rails.application.routes.draw do
 
  devise_for :admin, skip:[:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  #customer用itemのパス
  resources :items, only: [:index, :show]
  namespace :admin do
    get '/' => 'homes#top'
    
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
  end
    
  #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
  }

  #顧客情報関連
  get '/customers/my_page' => 'customers#show'
  get '/customers/infomation/edit' => 'customers#edit'
  patch '/customers/infomation/up_date' => 'customers#update'
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  patch '/customers/withdraw' => 'customers#withdraw'
  #カート関連

  delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
  resources :cart_items, only: [:index, :update, :destroy, :create]
   # 管理者用
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
