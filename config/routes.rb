Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }

  resources :animes, only: [:edit, :update]
  get '/animes/:year/:season', to: 'animes#index', as: 'animes'

  post 'watches/create'
  delete 'watches/destroy'

  resources :archives, only: [:index]

  get '/:username', to: 'mypages#show', as: 'mypages'
end
