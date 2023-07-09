/// @description Insert description here
// You can write your code in this editor

mp_grid_path(obj_player.a_star_grid, target_path, x, y, obj_player.x, obj_player.y, 1)
	
path_start(target_path, 8, 3, 0)

with(obj_minion)
{
	if (id!=other.id) and (place_meeting(x, y, other))
	{
		var _dx = other.x - x
		var _dy = other.y - y
		
		var _distance = sqrt(_dx*_dx + _dy*_dy)
		
		_dx = _dx/_distance
		_dy = _dy/_distance
		
		move_and_collide(-overlap_push_strength*_dx, -overlap_push_strength*_dy, obj_wall, 5)
	}
}