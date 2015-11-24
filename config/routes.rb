Rails.application.routes.draw do

  get 'home/index'
  root :to => 'home#index'

  devise_for :users

  resources :users, path: 'customusers', shallow: true do
    get 'search', to: 'users#search', as: 'search', on: :collection
  end

  resources :teams, shallow: true do
    get 'search', to: 'teams#search', as: 'search', on: :collection
  end

  resources :moods, shallow: true do
    get 'search', to: 'moods#search', as: 'search', on: :collection
  end

  resources :control_moods, shallow: true do
    get 'search', to: 'control_moods#search', as: 'search', on: :collection
  end

end
