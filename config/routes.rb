Rails.application.routes.draw do
  devise_for :users
  root to: 'home#dashboard'
  resources :organizations, only: [:new, :create, :index] do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
