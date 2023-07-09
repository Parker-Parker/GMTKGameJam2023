/// @description Insert description here
// You can write your code in this editor

instance_create_depth(other.x, other.y, -1, obj_explosion)
instance_destroy(other)

hp -= 1

if image_index = 0
{
	image_index = 1
}