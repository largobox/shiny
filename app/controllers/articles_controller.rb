class ArticlesController < ApplicationController

	def blog
		@articles = Article.where(ended: true).page(params[:page]).per(6)
	end

	def basics		
	end

	def guides
	  @guides = Hero.joins("LEFT JOIN articles_heros ON articles_heros.hero_id = heros.id").
	  							 joins("LEFT JOIN articles ON articles.id = articles_heros.article_id").
	  						   where("articles.topic = 'Гайд на героя'").
	  						   order :name   		
	end

	def show
		        @overview = 'Краткий обзор'
		          @skills = 'Механика скиллов'
		       @pick_time = 'Стадия пика'
		          @lining = 'Выбор линии'
		 @hero_bad_choice = 'Неудобные противники'
		@hero_good_choice = 'Удобные противники'
		     @start_items = 'Начальный закуп'
		      @early_game = 'Ранняя стадия'
		        @mid_game = 'Середина игры'
		       @late_game = 'Поздняя стадия'
		  @good_teammates = 'Поговорим о союзниках'
		     @skillbuilds = 'Скиллбилд'

		@article = Article.find(params[:id])
       @hero = Hero.new

		if @article.topic == 'Гайд на героя'
		  article_hero = (ArticlesHero.where article_id: @article.id).first
		  @hero = Hero.find(article_hero.hero_id)
		end


	  if @article.nil?
    	render text: 'Wow... Sorry us, but page not found', status: 404
    else
      add_view
    end
	end

	def add_view
		@article = Article.find(params[:id])

		view = View.new
		view.article_id = params[:id]
		view.client_ip = request.remote_ip

		if current_user
		  view.user_id = current_user.id
		  if (View.find_by user_id: current_user.id).nil?
		  	@article.view_counter += 1
		  	@article.save
		    view.save 
		  end 
		else		  
		  if (View.find_by client_ip: request.remote_ip).nil?
		  	@article.view_counter += 1
		  	@article.save
		    view.save 
		  end
		end
	end

end
