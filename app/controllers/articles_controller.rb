class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  def update
    @article.update(article_params)
    flash.notice = "Article #{@article.title} updated!"
    redirect_to article_path(@article)
  end
  def edit
    
  end
  def destroy
    @article.destroy
    flash.notice = "Article deleted!"
    redirect_to articles_path
  end
  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article: #{@article.title} saved!"
    redirect_to article_path(@article)
  end
  def new
    @article = Article.new
  end
  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  def index
    @articles = Article.all
  end
end