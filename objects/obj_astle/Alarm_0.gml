/// @description Spawn Building
// You can write your code in this editor

var furthest = instance_furthest(x,y,obj_tower_parent)

if(instance_exists(furthest)) {
	
}
else{
	instance_create_depth(x-100, y-200,depth-1,obj_tower_basic,{ammo:obj_missile, fire_frequency,fire_direction_tick:0, fire_frequency:1, fire_direction:180})	
}




