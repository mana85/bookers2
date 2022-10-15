Rails.application.routes.draw do

  devise_for :users

  # ルートページ
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"

  resources :books, only:[:new, :create, :index, :show]
  # get 'books/index'
  # get 'books/show'

  resources :users, only:[:show, :edit, :update, :index]
  # get 'users/edit'
  # get 'users/index'
  # get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
