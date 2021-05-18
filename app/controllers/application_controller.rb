class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? # esto es para que tambien funcione en las vistas
    def current_user
        @current_user||= User.find(session[:user_id]) if  session[:user_id]  #lo que hace es que evita que se tenga que hacer una consulata de la base de datos cada vez que se efectue este metodo 
    end
    def logged_in?
        !!current_user #me convierte el current user en un booleano para savber si estoy dentro ofuera de un usuario
        #current user se llevo a application _controller para que este tambien se pueda usar en los controladores y no  en las vistas
    end
    def require_user
            if !logged_in? # esto es para que sea necesario estar loguiado para efectuar alguna accion, este es el mensaje
                flash[:alert] = "You must be logged to perform that action"
                redirect_to login_path
            end
        
    end
end
