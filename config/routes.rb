Rails.application.routes.draw do
  root to: "swords#index"
  resources :swords
end