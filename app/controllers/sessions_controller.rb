class SessionsController < ApplicationController
    def new
    
    end
    def create
        user= User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])

            session[:user_id] = user.id #con esto es que mantenemos la sesion iniciada

           flash[:notice]="logged in"
           redirect_to user
        else
        flash.now[:alert]="there was something wrong"
        render "new"
        end
    end
    def destroy
        session[:user_id]=nil
        flash[:notice]= "logged out"
        redirect_to root_path
    end
    
end