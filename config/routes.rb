Rails.application.routes.draw do
  
  resources :drafts
  resources :items
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, param: :username, path: '/' do
    member do
      get :following, :followers
    end
  end
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
end
