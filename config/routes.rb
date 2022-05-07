Rails.application.routes.draw do
  get 'chats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
    get "daily_posts" => "users#daily_posts"
  end

  resources :groups do
    get "join" => "groups#join"
    delete "all_destroy" => "groups#all_destroy"
  end

  get "search" => "searches#search"
  get "category_search" => "category_searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chats, only: [:show, :create]
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

end