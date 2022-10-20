class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            # render 'new'
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    private
    def article_params
        #whitelisting values of article
        params.require(:article).permit(:title, :description)
    end
end