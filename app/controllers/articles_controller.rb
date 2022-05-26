class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect --this line of code prints out the contents of the article form
    @article = Article.new(article_params) #article_params is a method that return the article information entred in the browser
    @article.save #saving in the database
    redirect_to articles_show(@article)
  end

  #This method will store the entered info on the form
  private
    def article_params
      params.require(:article).permit(:title, :description) #This line will take information from the article form and allow title and description to be stored
    end
end