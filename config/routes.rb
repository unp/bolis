Rails.application.routes.draw do
  devise_for :users
  get 'events/:id/donations/new', to: 'donations#new', as: :new_donation
  post 'events/:id/donations', to: 'donations#create', as: :create_donation

  resources :events, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :event_slots, only: [:new]
  end
  resources :event_slots, only: [:create, :edit, :update, :destroy]
  resources :slots
  resources :sites, only: [:edit, :update]
  resources :donations, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'admin', to: 'pages#admin', as: :admin
  root 'pages#index'
end
