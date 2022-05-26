Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  #This is the default route
  root 'pages#home'
  #About page path
  get 'about', to: 'pages#about'

  #create resources 
  resources :articles
  # Defines the root path route ("/")
  # root "articles#index"
end
