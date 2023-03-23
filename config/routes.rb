Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }, sign_out_via: [:get, :delete]
  root "welcome#index"
  resources :groups, only: [:index, :show, :new, :create] do
    resources :expenses, only: [:new, :create]
  end
end
