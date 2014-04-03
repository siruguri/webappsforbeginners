RailsLMS::Application.routes.draw do
  # Added API and Doorkeeper
  root to: 'tasks#index'

  namespace :api, defaults: {format: 'json'} do
    resources :tasks
  end

  use_doorkeeper

  resources :categories
  resources :navbar_entries
  resources :tasks
  
  devise_for :users, ActiveAdmin::Devise.config

  # Simple CMS with pages, edits through ActiveAdmin
  ActiveAdmin.routes(self)

  namespace :cms do 
    get "/pages/(:id)/(:template)" => "pages#show"
  end

  resources :users, path: 'profiles'

  ResqueWeb::Engine.eager_load!
  mount ResqueWeb::Engine => "/resque"

end
