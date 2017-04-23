Rails.application.routes.draw do
  root 'static_pages#home'
  resources :cours, only: [:index]
  resources :animes, only: [:index]
end
