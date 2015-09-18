Rails.application.routes.draw do
  root 'books#index'
  resources :books, except: [:edit, :update, :delete] do
    resources :reviews, only: [:index, :new, :create]
  end
end
