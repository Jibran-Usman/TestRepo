class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :authenticate_user!

	def show
    @em = ''
    @em = current_user.email if user_signed_in?
    #UserMailer.send_mail(@em).deliver_later
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

	def index
    @aticles = Article.page(params[:page])
 	end

	def new
  	@article = Article.new
	end

	def edit
  	@article = Article.find(params[:id])
	end
 
	def create
  	@article = Article.new(article_params)
 
  	if @article.save
    	redirect_to @article
  	else
    	render 'new'
  	end
	end

	def update
  	@article = Article.find(params[:id])
 
  	if @article.update(article_params)
    	redirect_to articles_path
  	else
    	render 'edit'
  	end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

    respond_to do |format|
      format.html { redirect_to articles_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
	end

private
  def article_params
    params.require(:article).permit(:title, :text, :category)
  end
end
