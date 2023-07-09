/// @description Insert description here
// You can write your code in this editor

if image_index != 0 and timer <= 0
{
	image_index = 0
	timer = 3
}

timer --


if hp <= 0
{
	instance_destroy()
	room_goto_next()
}