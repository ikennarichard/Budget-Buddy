Rails.application.routes.draw do
  devise_for :users

  root "splash#index"

  resources :sales
  resources :groups
  
  get 'sign_out', to: 'application#sign_out_user', as: 'sign_out_user'
end
