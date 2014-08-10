Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  root to: 'talents#index'

  resources :projects do
    resources :talents do
      get 'show_project_detail', to: 'favorites#show_project_detail'
      patch 'project_detail', to: 'favorites#project_detail'
    end
  end

  resources :talents do
    collection do
      get 'search'
      get 'search_keywords'
    end
    member do
      get  'add_my_favorite', to: 'talents#add_my_favorite_confirm'
      post 'add_my_favorite', to: 'talents#add_my_favorite'
    end

    resources :offer
    resources :projects do
      resources :offer
    end
  end

  resources :favorites, only: [:index, :new, :create, :destroy], except: [:new] do
    collection do
      get 'new/:talent_id', to: 'favorites#new', as: :new
    end
  end

  get '/admin' => redirect('/admin/home')
  namespace :admin do
    get 'home', to: 'home#index'
    resources :sessions, only: [:new, :create, :destroy]
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    delete '/signout' => 'sessions#destroy'

    resources :offers
  end
end
