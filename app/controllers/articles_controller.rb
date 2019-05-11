class ArticlesController < ApplicationController
  before_action :set_article, only: %w[show]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.merge!({author: current_user}))

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

