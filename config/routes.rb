BigPie::Application.routes.draw do

  root 'items#index'

  get 'users/:id/like/:likeable_type/:likeable_id' => 'users#like', as: :like_likeable
  get 'users/:id/dislike/:likeable_type/:likeable_id' => 'users#dislike', as: :dislike_likeable

  get 'users/:id/follow/:other_id' => 'users#follow', as: :follow_user
  get 'users/:id/unfollow/:other_id' => 'users#unfollow', as: :unfollow_user
  get 'tags/:tag', to: 'items#index', as: :tag
  resources :relationships, only: [:create, :destroy]
  resources :items do
    resources :comments
  end
  devise_for :users
  resources :users do
    member do
      get :followings, :followers
    end
  end

end
