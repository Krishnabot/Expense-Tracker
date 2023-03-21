Rails.application.routes.draw do
devise_for :users, controllers: { registrations: 'users/registrations' }, sign_out_via: [:get, :delete]
     resources :group_operations
   root "landing_page#index"
    resources :groups do
    resources :operations
  end
end
