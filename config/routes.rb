Rails.application.routes.draw do

  root 'home#top'
  get 'home/about' => "home#about"

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]
  
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end

  resources :book_comments, only: [:destroy]
  


  #createのようにネストさせる必要はなし createとは別にする方が楽でよい。
 

end