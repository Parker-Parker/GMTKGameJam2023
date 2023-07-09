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

move_and_collide(xspeed, yspeed, obj_wall, 5)







