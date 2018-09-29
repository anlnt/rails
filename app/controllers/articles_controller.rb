class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)
    @article.save

    render json: @article, status: :ok
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
