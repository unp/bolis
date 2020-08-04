Rails.application.routes.draw do
  resources :donations, only: [:create]
  get 'events/:id/open_slots', to: 'donations#new', as: 'open_slots'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
