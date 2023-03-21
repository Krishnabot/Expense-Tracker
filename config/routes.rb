Rails.application.routes.draw do
devise_for :users, controllers: { registrations: 'users/registrations' }, sign_out_via: [:get, :delete]
   root "landing_page#index"
    resources :groups do
    resources :expenses
  end
end
