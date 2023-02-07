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
    
    resources :posts ,only:[:index, :show, :new, :edit]
    post 'posts' => 'posts#create'
    
    get 'relationships/followings'
    get 'relationships/followers'
  
    resources :users ,only:[:index, :show, :edit, :update] do
      resource :relationships,only:[:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
        get 'users/unsubscribe'
    end
  end


  # #admin
  # namespace :admin do
  #   get 'homes/top' => "homes#top", as:"top"
  #   #unsubscribeのルーティングを追加する
  #   #statusのルーティング追加する
  #   resources users ,only:[:index]
  #   resources posts ,only:[:index]
  #   resources genres,only:[:index, :create, :edit, :update]
  # end
  
  
  # #public
  # root to: 'homes#top'
  # scope module: :public do
  #   resources users ,only:[:index, :show, :edit, :update, :index]
  #   resources posts
  # end
end
