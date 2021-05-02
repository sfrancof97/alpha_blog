Rails.application.routes.draw do
  root "pages#home"

  get "about", to: "pages#about"
  resources :articles, only:[:show] #esto me trae todas las rutas de articles(es la db), articles_controller
  #estas las puedo ver con rails routes --expanded , el only es para traer un ruta en especifico
end
