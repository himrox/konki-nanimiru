Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }
  root 'static_pages#home'
  resources :animes, only: [:edit, :update]
  get '/animes/:year/:season', to: 'animes#index', as: 'animes'
  post 'watches/create'
  delete 'watches/destroy'
  get 'watches/:year/:season', to: 'watches#index', as: 'watches'
end
