Rails.application.routes.draw do
  
  resources :drafts
  resources :items
  resources :users do
    member do
      get :following, :followers
    end
  end
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
end
