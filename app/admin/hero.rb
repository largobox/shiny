ActiveAdmin.register Hero do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name,
					    :main_attr,
					    :base_strength,
					    :increase_strength,
					    :base_agility,
					    :increase_agility,
					    :base_intelligence,
					    :increase_intelligence,
					    :base_movement_speed,
					    :base_armor,
					    :base_min_damage,
					    :base_max_damage,
					    :attack_range,
					    :base_attack_time,
					    :rotation_speed,
					    :base_hp_regen,
					    :hero_pic,
					    roles: []

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do 
	  column :name  
	  column :main_attr 
	  actions
	end

  form do |f|
		inputs 'Details' do
      input :name, :input_html => { :max_width => 200 }
		  input :hero_pic, as: :file, :hint => f.template.image_tag(f.object.hero_pic.url(:normal))
		  input :main_attr, as: :select, collection: ['Сила', 'Ловкость', 'Интеллект']
      input :roles, multiple: true, as: :check_boxes, collection: ['Carry', 'Disabler', 'Initiator','Jungler', 'Midder', 'Nuker', 'Offlaner', 'Pusher', 'Support']
      input :base_strength
      input :increase_strength
      input :base_agility
      input :increase_agility
      input :base_intelligence
      input :increase_intelligence
      input :base_movement_speed
      input :base_armor
      input :base_min_damage
      input :base_max_damage
      input :attack_range
      input :base_attack_time
      input :rotation_speed
      input :base_hp_regen
    end
    actions
	end


end
