Rails.application.routes.draw do

  get 'home/index'
  root :to => 'home#index'

  devise_for :users
  
  resources :users, path: 'customusers', shallow: true do
    get 'search', to: 'users#search', as: 'search', on: :collection
  end

  resources :teams
  resources :moods
  resources :control_moods
end
