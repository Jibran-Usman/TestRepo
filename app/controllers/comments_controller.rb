class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
   
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
   
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end