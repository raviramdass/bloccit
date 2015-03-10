Bloccit::Application.routes.draw do

  devise_for :users
  resources :users
  
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
  end
  
  resources :posts, only: [:index]

  #nested routes
  #resources :topics do
  #resources :posts, except: [:index] do
  #resources :comments, only: [:create, :new, :destroy]
  #resources :favorites, only: [:create, :new, :destroy]
  
  resources :posts, only: [:index]
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
      post '/up-vote', to: 'votes#up_vote', as: :up_vote
      post '/down-vote', to: 'votes#down_vote', as: :down_vote
    end
  
  get 'about' => 'welcome#about'
  
  root to: "welcome#index"

end