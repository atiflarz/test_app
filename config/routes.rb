Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :organizations, only: [:new, :create] do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
