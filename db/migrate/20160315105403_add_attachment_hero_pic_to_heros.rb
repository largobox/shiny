class AddAttachmentHeroPicToHeros < ActiveRecord::Migration
  def self.up
    change_table :heros do |t|
      t.attachment :hero_pic
    end
  end

  def self.down
    remove_attachment :heros, :hero_pic
  end
end
