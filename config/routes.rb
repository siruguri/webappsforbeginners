RailsLMS::Application.routes.draw do
  # Added API and Doorkeeper
  root to: 'cms/pages#show', id: 1,  template: 'template_2', layout: 'home'

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
    get "/pages/(:id)/(:template)/(:layout)" => "pages#show"
  end

  resources :users, path: 'profiles'

  ResqueWeb::Engine.eager_load!
  mount ResqueWeb::Engine => "/resque"

end
