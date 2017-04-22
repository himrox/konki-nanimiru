Rails.application.routes.draw do
  resources :cours, only: [:index]
end
