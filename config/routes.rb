Rails.application.routes.draw do

  devise_for :users

  # ルートページ
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"

  get 'books/index'
  get 'books/show'
  get 'users/edit'
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
