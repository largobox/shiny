class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
    	t.string :name
    	t.string :main_attr
    	t.string :roles, array: true
			t.float  :base_strength
			t.float  :increase_strength
			t.float  :base_agility
			t.float  :increase_agility
			t.float  :base_intelligence
			t.float  :increase_intelligence
			t.float  :base_movement_speed
			t.float  :base_armor
			t.float  :base_min_damage
			t.float  :base_max_damage
			t.float  :attack_range
			t.float  :base_attack_time
			t.float  :rotation_speed
			t.float  :base_hp_regen
      t.timestamps null: false
    end
  end
end
