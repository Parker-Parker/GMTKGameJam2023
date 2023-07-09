/// @description Insert description here
// You can write your code in this editor

time -= 1

if time <= 0 and distance_to_object(obj_player) > 500
{
	time = max_time + random_range(-15, 15)
	instance_create_depth(x, y, depth-1, obj_minion)
}