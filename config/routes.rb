Rails.application.routes.draw do
  get 'contacts/new'
  post 'contacts/create'
  devise_for :users
  resources :articles
  root "articles#index"
end
