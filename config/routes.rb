Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "signup", to: "users#new"
  resources :users, esxept:[:new]

 
  resources :articles #esto me trae todas las rutas de articles(es la db), articles_controller
  #estas las puedo ver con rails routes --expanded , el only es para traer un ruta en especifico

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
