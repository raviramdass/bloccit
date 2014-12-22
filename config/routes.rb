Bloccit::Application.routes.draw do
  get "topics/index"
  get "topics/new"
  get "topics/show"
  get "topics/edit"
  devise_for :users
  resources :users, only: [:update]
  resources :topics do
  resources :posts, except: [:index]
  resources :comments, only: [:index]
  end
  get 'about' => 'welcome#about'
  root to: 'welcome#index'


end
