Rails.application.routes.draw do
  devise_for :users
  root to: 'challenges#index'
  get 'challenge', to: 'challenges#new'
  post 'challenge', to: 'challenges#create'
  get 'challenges', to: 'challenges#index'

  get 'search', to: 'tags#search'

  get 'vote', to: 'votes#vote'
end
