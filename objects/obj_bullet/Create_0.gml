/// @description Insert description here
// You can write your code in this editor
//direction = 90
damage = 5
image_angle = direction -90
health = 5
if(lifetime>0){
	
	alarm_set(0,60*lifetime)

}


wall_timer = 3
//wall_collision = false
wall_collision = true
alarm_set(6,60*wall_timer)