class Article < ActiveRecord::Base

  has_many :comments
  has_many :likes	
  has_many :views	  
  
end
