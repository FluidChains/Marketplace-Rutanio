Rails.application.routes.draw do

  get 'main/index'
  get 'search/create'
  resources :skills
  resources :categories
  resources :services do
    resources :requests

  end
  devise_for :users
  get 'welcome/search'
  get 'welcome/index'
  get 'welcome/postulaciones'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
