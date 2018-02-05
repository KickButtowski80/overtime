Rails.application.routes.draw do
  resources :posts
  devise_for :users, skip: [:registrations]
  get 'welcome/index'

  root to: 'welcome#index'
end
