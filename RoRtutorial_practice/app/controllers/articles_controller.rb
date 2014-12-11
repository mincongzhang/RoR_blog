class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "min", password: "cong", except: [:index, :show]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        #without this @article will be a nil, 
        #error will occur when calling @article.errirs.any?
        @article = Article.new
    end

    def create
        #Directly show params(title and text)
        #render plain: params[:article].inspect 

        #get params and save to object @article, 
        #transmit @article to views page and handle @article
        @article = Article.new(article_params) 

        if @article.save
            #redirect to new created page, which is saved as @article
            redirect_to @article
        else
            #show in the same page without redirect to new created page
            render 'new'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
        def article_params
          params.require(:article).permit(:title,:text)
        end
end
