class ArticlesController < ApplicationController
    before_action:set_article, only:[:show,:edit,:update,:destroy] #lo que hace es que ejecuta la funcoion seleccionada al inicio de cada metodo mencionado en []
    def show
        #byebug #esto me sirvepara parar el servidor aca y si coloco params me muestra los parametros o params[:id] me da el id que uso 
    end
    def index
        @articles = Article.paginate(page: params[:page], per_page: 500)

        
    end
    def new
        @article = Article.new #necesario para que la primera vez que se renderiza la pagina exista un @article en el if de la vista
    end
    def edit

    end
    def create
        @article= Article.new(article_params)#necesario para resivir el articulo
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was created successfully"
            redirect_to article_path(@article) #esto nos reenvia a el path que esogemos, el article_path nos dice a que controlador va , para verlos se usa el router en la consola
        else
            render "new"
        end

    end
    def update
     #   @article=Article.find(params[:id]) #esto es para apuntar a que articulo se le va a cambiar la info
        if @article.update(article_params) #con esto se cambia la info 
            flash[:notice]= "article was updated successfully"
            redirect_to @article
         else
            render "edit"
        end
    end
    def destroy
       
        @article.destroy
        redirect_to articles_path
    end

    private #signefica que todos los metodos que realice solo sirven para este controlador

    def set_article
        @article=Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end
end