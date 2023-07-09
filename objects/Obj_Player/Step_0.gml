/// @description Insert description here
// You can write your code in this editor

// Move Keys
// Up
if (keyboard_check(vk_up))
{
	yspeed -= xlr8
}
// Down
if (keyboard_check(vk_down))
{
	yspeed += xlr8
}
// Left
if (keyboard_check(vk_left))
{
	xspeed -= xlr8
}
// Right
if (keyboard_check(vk_right))
{
	xspeed += xlr8
}

// friction
// X friction
if (abs(xspeed) > 0)
{
	xspeed *= 0.8
}
// Y friction
if (abs(yspeed) > 0)
{
	yspeed *= 0.8
}

// If speed greater than max speed, sets speed to max
if (sqrt(xspeed*xspeed + yspeed*yspeed) > maxspeed)
{
	xspeed *= maxspeed/sqrt(xspeed*xspeed + yspeed*yspeed)
	yspeed *= maxspeed/sqrt(xspeed*xspeed + yspeed*yspeed)
}

// Moves char
move_and_collide(xspeed, yspeed, obj_wall, 5)

// path follow code
if (sqrt((x - path[0][0])*(x - path[0][0]) + (y - path[0][1])*(y - path[0][1])) > path_resolution)
{
	// Adds current position to path array if player has sufficienctly moved far enough
	array_insert(path, 0, [x,y,100 + 100/path_length])
	// If the path array is too long, removes oldest position
	if (array_length(path) > path_length)
	{
		array_delete(path, path_length + 1, 1)
	}
	// Subtracts points from each point so oldest point has lowest score and newest point has highest
	array_foreach(path, function(_val, _index)
	{
		_val[2] -= 100/path_length
	})
	
}


if(hp<=0){
	
	instance_create_depth(x,y,depth,obj_explosion,{damage:0})
	var swap_target = instance_nearest(x, y, obj_minion)
	if(instance_exists(swap_target)){
		x = swap_target.x
		y = swap_target.y
		hp = 100
		instance_destroy(swap_target)
	}
	else{
		//round over :(	
	}

}