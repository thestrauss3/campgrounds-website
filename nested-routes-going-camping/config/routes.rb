Rails.application.routes.draw do
  devise_for :models
  # get  'static_pages/:page' => "static_pages#show"
  # root 'static_pages#home'
  # get 'home' => redirect('static_pages/home')
  resources :campers, only: [:index, :show] do
    resources :supplies, only: [:index]
  end
  resources :campgrounds, only: [:index, :show] do
    resources :campers, only: [:index]
    resources :supplies, only: [:index]
    resources :reviews, only: [:index, :new, :create]
  end
  resources :supplies, only: [:index]
  resources :reviews, only: [:show]
  resources :static_pages, only: [:error_page]

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
  # get '*path' => 'static_pages#error_page'


end
