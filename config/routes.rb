Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end
  get 'site/index'
  get 'admins_backoffice/index'
  get 'users_backoffice/index'
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    get 'zip_code', to: 'zip_code#show'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
  devise_for :users
  devise_for :admins, skip: [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'backoffice', to: 'admins_backoffice/welcome#index'
  root to: 'site/welcome#index'

end
