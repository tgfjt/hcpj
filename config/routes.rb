Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  root to: 'talents#index'
  resources :projects
  resources :talents do
    collection do
      get 'search'
    end
    member do
      get 'add_my_favorite',  to: 'talents#add_my_favorite_confirm'
      post 'add_my_favorite', to: 'talents#add_my_favorite'
    end
  end

  resources :favorites, only: [:new, :create, :destroy], except: [:new] do
    collection do
      get 'new/:talent_id', to: 'favorites#new', as: :new
    end
  end
end
