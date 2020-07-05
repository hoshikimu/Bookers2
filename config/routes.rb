Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'follow/:user_id' => 'relationships#follow', as: 'follow'
  get 'follower/:user_id' => 'relationships#follower', as: 'follower'
  get 'search' => 'search#search'
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
  end
end