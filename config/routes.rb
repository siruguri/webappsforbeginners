RailsLMS::Application.routes.default_url_options[:script_name] = ActionController::Base.config.relative_url_root || '/'

RailsLMS::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # Added API and Doorkeeper
  root to: 'cms/pages#show', id: 1,  template: 'template_1', layout: 'home'

  namespace :api, defaults: {format: 'json'} do
    resources :tasks
  end

  use_doorkeeper

  resources :categories
  resources :navbar_entries
  resources :tasks

  namespace :cms do 
    get "/pages/(:id)/(:template)/(:layout)" => "pages#show"
  end

  ResqueWeb::Engine.eager_load!
  mount ResqueWeb::Engine => "/resque"
end
