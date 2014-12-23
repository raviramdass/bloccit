Bloccit::Application.routes.draw do


  devise_for :users

  resources :users, only: [:update]

  #nested routes
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :new]
    end
  end
  

  get 'about' => 'welcome#about'
  
  root to: "welcome#index"
end
