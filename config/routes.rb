Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  get 'site/index'
  get 'admins_backoffice/index'
  get 'users_backoffice/index'
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'site/welcome#index'

end
