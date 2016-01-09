class ShinyCommentsController < ApplicationController

	def index
		@comments = ShinyComment.where(article_id: params[:article_id])
		@comment = ShinyComment.new
    @user_comments_id = Like.pluck(:comment_id)
		@article_title = Article.find(params[:article_id]).title
	end

	def create
    @comment = ShinyComment.new(shiny_comment_params)

    if @comment.body.blank?
      flash[:notice] = 'Комментарий не может быть пустым'
    else
      @comment.save
      flash[:notice] = 'Ваш комменарий будет опубликован сразу после премодерации'
    end

    redirect_to :back
	end

	def shiny_comment_params
    params.require(:shiny_comment).permit(:body, :article_id)
  end

  def comment_like
    if current_user.nil?
      redirect_to :back
    else
      @comment = ShinyComment.find(params[:format])
      @comment.likes += 1
      @comment.save
      @like = Like.create(comment_id: params[:format], user_id: current_user.id)
      redirect_to :back
    end
  end

  def comment_dislike
    if current_user.nil?
      redirect_to :back
    else
      @comment = ShinyComment.find(params[:format])
      @comment.likes -= 1
      @comment.save
      @like = Like.create(comment_id: params[:format], user_id: current_user.id)
      redirect_to :back
    end
  end

end
