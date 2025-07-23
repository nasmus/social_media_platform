Rails.application.routes.draw do
  get "likes/index"
  get "comments/index"
  root "posts#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :posts do
    resources :comments, only: [:create]
    resources  :likes, only: [:create, :destroy]
  end

end
