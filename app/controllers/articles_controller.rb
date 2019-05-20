class ArticlesController < ApplicationController
  before_action :set_article, only: %w[show]
  after_action :create_message, only: %w[show]

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

  def statistics
    response = HTTParty.get("http://localhost:3001/views/#{params[:article_id]}")

    @hash = JSON.parse(response.body)

    @hash[:article] = Article.find(params[:article_id])

    render 'articles/statistics'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def create_message
    return if current_user.articles.include?(@article)

    DeliveryBoy.deliver_async({ resource_visited: params[:id].to_i,
                                user: current_user.email,
                                city: current_user.city }.to_json,
                              topic: 'article', partition_key: params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

