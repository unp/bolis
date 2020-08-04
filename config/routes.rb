Rails.application.routes.draw do
  devise_for :users
  get 'events/:id', to: 'donations#new', as: :event
  post 'events/:id', to: 'donations#create', as: :create_event
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'admin', to: 'pages#admin', as: :admin
  root 'pages#index'
end
