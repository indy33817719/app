class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:edit, :update, :destro]

  def index
    @articles = Article.order(created_at: :desc)
    @articles = Article.page(params[:page]).per(8)
  end

  def show

  end

  def edit
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Post completed!'
    else
      render :new, alert: 'Post failed..'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Update completed!'
    else
      render :edit, alert: 'Update failed..'
    end
  end

  def destroy
    @article.destroy
    if @article.destroy
      redirect_to root_path, notice: 'Delete completed!'
    else
      redirect_to root_path, alert: 'Delete failed..'

    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :body)
  end
end
