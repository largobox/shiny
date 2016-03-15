class CreateArticlesHeros < ActiveRecord::Migration
  def change
    create_table :articles_heros, id: false do |t|
      t.belongs_to :article, index: true
      t.belongs_to :hero, index: true
    end
  end
end
