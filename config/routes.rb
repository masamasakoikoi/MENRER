Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  namespace :admin do
    
    resources :genres ,only:[:index, :create ,:edit, :update]
  
    resources :posts ,only:[:index]
    
    resources :users ,only:[:index]
    get 'users/unsubscribe'
    get 'users/status'
  end
  
  
  scope module: :public do
    root to: 'homes#top'
    
    # patch 'users/id' => "users#edit", as: "edit"
    
    resources :posts ,only:[:index, :show, :new, :edit] do
      resource :favorites, only: [:create, :destroy]
    end
    
    post 'posts' => 'posts#create'
    
    get 'relationships/followings'
    get 'relationships/followers'
  
    resources :users ,only:[:index, :show, :edit, :update] do
      get 'users/unsubscribe'
      
      
      resource :relationships,only:[:create, :destroy]
          get 'followings' => 'relationships#followings', as: 'followings'
          get 'followers' => 'relationships#followers', as: 'followers'
          
    end
  end

end
