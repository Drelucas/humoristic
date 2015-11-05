Rails.application.routes.draw do

  devise_for :users
  
  resources :users

  get 'users/search/:name', controller: :users, action: :search

  resources :teams
  resources :moods
  resources :controls_mood
  get 'home/index'
  root :to => 'home#index'

end
