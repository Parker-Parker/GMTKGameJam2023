/// @description Spawn Building
// You can write your code in this editor

var furthest = instance_furthest(x,y,obj_tower_basic)

if(instance_exists(furthest)) {
	var tower = random(4)
	var dist = random(distance_to_object(furthest)+50)
	var angle = random(360)
	var dx = lengthdir_x(dist,angle)
	var dy = lengthdir_y(dist,angle)
	tower_x = x+dx
	tower_y = y+dy
	
	while(tower_x<0||tower_x>room_width||tower_y>room_height||tower_y<0){
		dist *= 0.8
		dx = lengthdir_x(dist,angle)
		dy = lengthdir_y(dist,angle)
		tower_x = x+dx
		tower_y = y+dy
	}
	
	
	switch (tower)
	{
	    case 0:	
			instance_create_depth(tower_x, tower_y,depth-1,obj_tower_basic,{ammo_type:obj_missile,fire_direction_tick:45, fire_frequency:1, fire_direction:180})	
	    break;
	    case 1:	
			instance_create_depth(tower_x, tower_y,depth-1,obj_tower_basic,{ammo_type:obj_bullet,fire_direction_tick:90, fire_frequency:3, fire_direction:180,fire_amount_per_shot:3,fire_spread:0})
	    break;
	    case 2:	
			instance_create_depth(tower_x, tower_y,depth-1,obj_tower_basic,{ammo_type:obj_bullet,fire_direction_tick:45, fire_frequency:2, fire_direction:180,fire_amount_per_shot:4,fire_spread:0})
	    break;
	    case 3:	
			instance_create_depth(tower_x, tower_y,depth-1,obj_tower_tracking,{ammo_type:obj_bullet,fire_direction_tick:0, fire_frequency:4, fire_direction:00,fire_amount_per_shot:1,fire_spread:0})
	    break;
	    default:	
			instance_create_depth(tower_x, tower_y,depth-1,obj_tower_basic,{ammo_type:obj_bullet,fire_direction_tick:45, fire_frequency:2, fire_direction:180,fire_amount_per_shot:5,fire_spread:30})
	    break;

	} 
	
	
}
else{
	instance_create_depth(x-100, y-200,depth-1,obj_tower_basic,{ammo_type:obj_missile,fire_direction_tick:0, fire_frequency:1, fire_direction:180})	
	instance_create_depth(x-100, y+200,depth-1,obj_tower_basic,{ammo_type:obj_missile,fire_direction_tick:0, fire_frequency:1, fire_direction:180})	
	instance_create_depth(x-100, y-300,depth-1,obj_tower_tracking,{ammo_type:obj_bullet,fire_direction_tick:0, fire_frequency:5, fire_direction:180,fire_amount_per_shot:1,fire_spread:30})	
	instance_create_depth(x-100, y+300,depth-1,obj_tower_tracking,{ammo_type:obj_bullet,fire_direction_tick:0, fire_frequency:5, fire_direction:180,fire_amount_per_shot:1,fire_spread:30})	
}

alarm_active = false

