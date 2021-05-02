class ArticlesController < ApplicationController
    def show
        #byebug #esto me sirvepara parar el servidor aca y si coloco params me muestra los parametros o params[:id] me da el id que uso 
        @article = Article.find(params[:id])
    end
end