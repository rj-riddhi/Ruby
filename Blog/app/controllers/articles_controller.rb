class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "Radhika", password: "radhika", except: [:home, :show]

  def home
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params_secure)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params_secure)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path,status: :see_other
  end

  private
  def article_params_secure
    params.require(:article).permit(:title, :body, :status)
  end

end
