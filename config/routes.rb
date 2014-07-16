Rails.application.routes.draw do

  get 'home/index'

  root to: 'talents#index'
  resources :projects
  resources :talents do
    collection do
      get 'search'
    end
  end
end
