Rails.application.routes.draw do
  root                 'static_pages#home'
  get       'about' => 'static_pages#about'
  resources :drafts
  resources :items
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, param: :username, path: '/', only: [:show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
