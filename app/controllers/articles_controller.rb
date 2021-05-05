class ArticlesController < ApplicationController
    def show
        #byebug #esto me sirvepara parar el servidor aca y si coloco params me muestra los parametros o params[:id] me da el id que uso 
        @article = Article.find(params[:id])
    end
    def index
        @articles = Article.all    
    end
    def new
        @article = Article.new #necesario para que la primera vez que se renderiza la pagina exista un @article en el if de la vista
    end
    def edit
        @article = Article.find(params[:id])
    end
    def create
        @article= Article.new(params.require(:article).permit(:title, :description))#necesario para resivir el articulo
        if @article.save
            flash[:notice] = "Article was created successfully"
            redirect_to article_path(@article) #esto nos reenvia a el path que esogemos, el article_path nos dice a que controlador va , para verlos se usa el router en la consola
        else
            render "new"
        end

    end
    def update
        @article=Article.find(params[:id]) #esto es para apuntar a que articulo se le va a cambiar la info
        if @article.update(params.require(:article).permit(:title, :description)) #con esto se cambia la info 
            flash[:notice]= "articlegas updated successfully"
            redirect_to @article
         else
            render "edit"
        end
    end


end