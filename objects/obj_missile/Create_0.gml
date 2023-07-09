/// @description Insert description here
// You can write your code in this editor


tracking = false
alarm_set(0,tracking_delay*60)
alarm_set(1,fuse_time*60)



wall_timer = 1
//wall_collision = false
wall_collision = true
alarm_set(6,60*wall_timer)
