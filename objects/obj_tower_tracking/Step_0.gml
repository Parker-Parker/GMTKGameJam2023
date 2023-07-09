/// @description Insert description here
// You can write your code in thi

if(can_fire){
	var nearest_minion = instance_nearest(x, y, obj_minion);
	var nearest_player = instance_nearest(x, y, obj_player);
	var target = nearest_player


	if(instance_exists(nearest_minion)){

		var dist_minion = point_distance(x, y, nearest_minion.x, nearest_minion.y);
		var dist_player = point_distance(x, y, nearest_player.x, nearest_player.y);
		if(dist_minion < dist_player){
			target = nearest_minion
		}
	}
	
	if((point_distance(x,y,target.x,target.y)<=range)||range==0){ //target is in range
		fire_direction = point_direction(x,y,target.x,target.y);
		
		
		
		if(fire_amount_per_shot<=1){
			instance_create_depth(x,y,depth+1,ammo_type,{direction:fire_direction})	
		}
		else{
	
			if(fire_spread<=0){
				for(var i = 0; i< fire_amount_per_shot; i++){
					var offset =  i*360/(fire_amount_per_shot)
					instance_create_depth(x,y,depth+1,ammo_type,{direction:(fire_direction+offset+360)%360})
				}
		
			}
			else{
				for(var i = 0; i< fire_amount_per_shot; i++){
					var offset = -fire_spread/2 + i*fire_spread/(fire_amount_per_shot-1)
					instance_create_depth(x,y,depth+1,ammo_type,{direction:(fire_direction+offset+360)%360})
				}
			}
		}

		fire_direction = (fire_direction + fire_direction_tick)%360

		alarm_set(0,60/fire_frequency)
		can_fire = false
		
	}
	
	
	
}






