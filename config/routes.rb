Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home_page#index"
  get 'home_page/:id/new', to: 'home_page#new'
  resources :home_page
  get 'home_page/comments/:id/new', to: 'comments#new'
  resources :comments

end
