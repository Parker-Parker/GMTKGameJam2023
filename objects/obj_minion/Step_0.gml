/// @description Insert description here
// You can write your code in this editor

// Chooses the next closest point along the player's path that the minion hasn't already passed
var next_valid_path_point = 0
for (var _i = 0; _i <= array_length(obj_player.path) - 1; _i++)
{
	// From closest to player to furthest, checks each path point to see if the minion is already at it's position
	var _dx = x - obj_player.path[_i][0]
	var _dy = y - obj_player.path[_i][1]
	var _distance = sqrt(_dx*_dx + _dy*_dy)
	
	// If minion is within 400 pixels of current point, it chooses the next path point as the target and breaks
	if _distance >= 400
	{
		next_valid_path_point = _i
	}
	else if _distance < 400 and _i > 0
	{
		break
	}
	else if _distance <= 400 and _i = 0
	{
		next_valid_path_point = -1
	}
	else
	{
		next_valid_path_point = -1
	}
}

// Creates the path the minion will take, using the chosen path point as the target
var _target_x = 0
var _target_y = 0
if next_valid_path_point = -1
{
	var _i = array_length(obj_player.last_location) - 1
	_target_x = obj_player.last_location[_i][0]
	_target_y = obj_player.last_location[_i][1]
}
else
{
	_target_x = obj_player.path[next_valid_path_point][0]
	_target_y = obj_player.path[next_valid_path_point][1]
}
mp_grid_path(obj_player.a_star_grid, target_path, x, y, _target_x, _target_y, 1)


// Makes Gobin change direction
// Weighted avg of facing player, facing target location, and facing direction of motion
var _angle_dif = (0.2*angle_difference(image_angle, direction + 90) + 0.5*angle_difference(image_angle, point_direction(x, y, _target_x, _target_y) + 90) + angle_difference(image_angle, point_direction(x, y, obj_player.x, obj_player.y) + 90))/1.7

if point_distance(x, y, obj_player.x, obj_player.y) < 50
{
	_angle_dif = angle_difference(image_angle, point_direction(x, y, obj_player.x, obj_player.y) + 90)
}
// Doesn't change the angle unless the angle difference is great enough to avoid jittering
// Smoothly rotates the Gobin at 5 degrees per frame
if abs(_angle_dif) > 15
{
	image_angle -= 5*abs(_angle_dif)/_angle_dif
}

// Animation Speed
image_speed = sqrt((x-last_x)*(x-last_x) + (y-last_y)*(y-last_y))/8
last_x = x
last_y = y

// Moves the minion along the path
path_start(target_path, 7, 3, 0)

// Minion self collision code
// Causes Minions to push themselves out of each other when overlapping
// Pushes each other out harder the more they overlap
with(obj_minion)
{
	if (id!=other.id) and (distance_to_object(other) < 15)
	{
		var _dx = other.x - x
		var _dy = other.y - y
		
		var _distance = sqrt(_dx*_dx + _dy*_dy)
		
		_dx = _dx/_distance
		_dy = _dy/_distance
		
		move_and_collide(-overlap_push_strength*_dx, -overlap_push_strength*_dy, obj_wall, 10)
	}
}

if(hp<=0){
	
	instance_create_depth(x,y,depth,obj_explosion,{damage:0})
	instance_destroy()

}