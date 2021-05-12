Rails.application.routes.draw do
  root "pages#home"

  get "signup", to: "users#new"
  resources :users, esxept:[:new]

  get "about", to: "pages#about"
  resources :articles #esto me trae todas las rutas de articles(es la db), articles_controller
  #estas las puedo ver con rails routes --expanded , el only es para traer un ruta en especifico
end
