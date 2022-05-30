class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end

  def new
    @article = Article.new #create an instance of Article database
  end

  # The create method is responsible for creating a new Article(saves data into database)
  def create
    # render plain: params[:article].inspect --this line of code prints out the contents of the article form
    @article = Article.new(article_params) #article_params is a method that return the article information entred in the browser
    if @article.save #saving in the database
      flash[:notice] = "Submitted Succesfully!"
      redirect_to article_path(@article)
    else
      render :new
    end
  end


  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Successfully updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  #This method will store the entered info on the form
  private
    def article_params
      params.require(:article).permit(:title, :description) #This line will take information from the article form and allow title and description to be stored
    end
end