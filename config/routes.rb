Rails.application.routes.draw do
   # 管理者用
  devise_for :admin, skip:[:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
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
  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  namespace :public do
    get '/customers/my_page' => 'customers#show'
    get '/customers/infomation/edit' => 'customers#edit'
    patch '/customers/infomation/up_date' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
