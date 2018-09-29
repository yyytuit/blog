class BlogsController < ApplicationController
   before_action :move_to_index, except: :index
  def index
    @articles = Article.all.order("id DESC")
  end

   def new
    @article = Article.new
    end

    def create
      # @article = Article.new
      Article.create(text: article_params[:text], user_id: current_user.id)
     redirect_to action: :index
    end
  def destroy
      article = Article.find(params[:id])
      if article.user_id == current_user.id
        article.destroy
      end
      redirect_to action: :index
    end

    def update

      article = Article.find(params[:id])
      if article.user_id == current_user.id
        article.update(article_params)
      end
      redirect_to action: :index
    end

    def edit
     @articles = Article.find(params[:id])
    end

     def show
   @articles= Article.find(params[:id])
  end


 private
    def article_params
      params.require(:article).permit(:text)
    end
def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
