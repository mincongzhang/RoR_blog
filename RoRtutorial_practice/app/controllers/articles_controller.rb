class ArticlesController < ApplicationController

    def new
        #no input params
    end

    def create
        #Directly show params(title and text)
        #render plain: params[:article].inspect 

        #get params and save to object @article, 
        #transmit @article to views page and handle @article
        @article = Article.new(article_params) 

        @article.save

        #redirect to new created page, which is saved as @article
        redirect_to @article
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    private
        def article_params
          params.require(:article).permit(:title,:text)
        end
end
