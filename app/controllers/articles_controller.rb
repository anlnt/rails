class ArticlesController < ApplicationController
  def create
    @article = Article.new(params.require(:article).permit(:title, :text))
    @article.save

    render json: @article, status: :ok
  end
end
