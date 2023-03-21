Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  devise_for :users, controllers: { registrations: 'users/registrations' }
     resources :group_operations
   root "groups#index"
end
