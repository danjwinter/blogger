class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' is now ONE OF US"
    redirect_to article_path(@article)
  end

  def destroy
    Article.find(params[:id]).destroy
    flash.notice = "Article '#{@article.title}' just went to the mother fucking cleaners!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' is now less sucky, congrats!"

    redirect_to article_path(@article)
  end
end
