class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @aticle.save
            flash[:notice] = "Article was successfully created."
            redirect_to articles_show(@article)
        else
            render 'new'
        end
    end

    private
        def article_params

        params.require(:article).permit(:title, :description)
        end

    def show
        @article = Article.find(params[:id])
    end
    
end