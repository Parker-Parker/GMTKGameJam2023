/// @description Insert description here
// You can write your code in this editor





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


