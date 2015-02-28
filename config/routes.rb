Bloccit::Application.routes.draw do

  devise_for :users
  resources :posts
  resources :topics
  resources :users, only: [:update]

  #nested routes
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :new, :destroy]
      resources :favorites, only: [:create, :new, :destroy]
      post '/up-vote', to: 'votes#up_vote', as: :up_vote
      post '/down-vote', to: 'votes#down_vote', as: :down_vote
    end
  end
  get 'about' => 'welcome#about'
  
  
  root to: "welcome#index"
end
