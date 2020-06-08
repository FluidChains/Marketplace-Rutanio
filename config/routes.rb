Rails.application.routes.draw do

  get 'main/index'
  get 'search/create'
  resources :skills
  resources :categories
  resources :services do
    resources :requests

  end
  put "/services/:id/publish", to: "services#publish"
  put "/services/:id/unpublish", to: "services#unpublish"
  devise_for :users
  get 'welcome/search'
  get 'welcome/index'
  get 'welcome/postulaciones'
  get 'welcome/vencido'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
