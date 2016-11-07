Rails.application.routes.draw do
  root 'sessions#new'
  resource :sessions, only: [:new, :create, :destroy]
  resources :applicants
  resources :pages

  get 'sessions/create'
  post 'sessions/create'
  delete 'pages' => 'pages#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
