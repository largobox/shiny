class ArticlesController < ApplicationController

	def blog
		@articles = Article.all
	end

	def basics		
	end

	def guides		
	end

	def show
	  if @article = Article.find(params[:id])
    else
    	render text: 'Page not found', status: 404
    end
	end

end
