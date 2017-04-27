Rails.application.routes.draw do
  root 'static_pages#home'
  resources :animes, only: [:edit, :update]
end
