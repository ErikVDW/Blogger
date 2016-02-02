module ArticlesHelper
  def get_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
end
