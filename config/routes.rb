Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do

    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
