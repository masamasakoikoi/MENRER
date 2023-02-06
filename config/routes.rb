Rails.application.routes.draw do
root to: 'homes#top'
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
  # scope module: :public do
  #   resources users ,only:[:index, :show, :edit, :update, :index]
  #   resources posts
  # end
end
