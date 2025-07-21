Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :posts do
    resources  :likes, only: [:create, :destroy]
  end
end
