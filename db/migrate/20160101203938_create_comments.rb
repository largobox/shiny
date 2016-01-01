class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|  
    	t.belongs_to :article,   index: true
    	t.belongs_to :user,      index: true         
      t.text       :body
      t.integer    :likes
      t.boolean    :moderated, default: false
      t.timestamps null: false
    end
  end
end
