class Article < ActiveRecord::Base

  has_many :shiny_comments
  has_many :likes	
  has_many :views	  
  
end
