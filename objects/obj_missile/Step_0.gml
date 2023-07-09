/// @description Insert description here
// You can write your code in this editor
if(tracking){
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


	var target_direction = point_direction(x,y,target.x,target.y);
	direction -= (max_turn_speed/60)*sign(angle_difference(direction,target_direction));

}
image_angle = direction -90