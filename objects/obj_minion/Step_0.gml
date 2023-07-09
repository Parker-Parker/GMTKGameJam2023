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
if next_valid_path_point = -1
{
	mp_grid_path(obj_player.a_star_grid, target_path, x, y, obj_player.x, obj_player.y, 1)
}
else
{
	mp_grid_path(obj_player.a_star_grid, target_path, x, y, obj_player.path[next_valid_path_point][0], obj_player.path[next_valid_path_point][1], 1)
}
// Moves the minion along the path
path_start(target_path, 7, 3, 0)

// Minion self collision code
// Causes Minions to push themselves out of each other when overlapping
// Pushes each other out harder the more they overlap
with(obj_minion)
{
	if (id!=other.id) and (place_meeting(x, y, other))
	{
		var _dx = other.x - x
		var _dy = other.y - y
		
		var _distance = sqrt(_dx*_dx + _dy*_dy)
		
		_dx = _dx/_distance
		_dy = _dy/_distance
		
		move_and_collide(-overlap_push_strength*_dx, -overlap_push_strength*_dy, obj_wall, min(50/max(_distance, 0.01), 10))
	}
}