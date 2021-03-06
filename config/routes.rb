Rails.application.routes.draw do
  root 'posts#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/easy_login', to: 'sessions#easy_login'
  delete '/logout', to: 'sessions#destroy'
  
  get 'news/bbc'
  get 'news/wsj'
  get 'news/yahoo'
  get 'news/nhk'
  
  resources :users do
    member do
      get :followings, :followers
    end
  end

  resources :relationships, only:[:create, :destroy]
  resources :genres, only: :show
  resources :posts, only:[:index,:show,:new,:create,:destroy] do
    resources :comments, only:[:new, :create, :destroy]
    resources :likes, only:[:create, :destroy]
  end
  
end
