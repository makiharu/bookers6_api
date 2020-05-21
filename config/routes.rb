Rails.application.routes.draw do

  root 'home#top'
  get 'home/about' => "home#about"

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]
  
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  post 'books/:id', to:  'books#show' #サンプル

  #createのようにネストさせる必要はなし
 #resource :book_comments, only: [:create, :destroy]
end