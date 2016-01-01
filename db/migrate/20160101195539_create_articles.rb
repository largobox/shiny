class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string     :title
    	t.string     :topic
      t.text       :body
			t.integer    :likes,    default: 0
			t.integer    :views,    default: 0
			t.integer    :comments, default: 0
      t.timestamps null: false
    end
  end
end
