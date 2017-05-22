Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :animes, only: [:edit, :update]
  get '/animes/:year/:season', to: 'animes#index', as: 'animes'
  post 'watches/create'
  delete 'watches/destroy'
end
