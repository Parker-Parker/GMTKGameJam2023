/// @description Insert description here
// You can write your code in this editorche
var keyLeft = keyboard_check(vk_left)	||keyboard_check(ord("A"))
var keyRight= keyboard_check(vk_right)	||keyboard_check(ord("D"))
var keyUp	= keyboard_check(vk_up)		||keyboard_check(ord("W"))
var keyDown	= keyboard_check(vk_down)	||keyboard_check(ord("S"))

//pizzatime = delta_time -delta +pizza
friction =-acc*spdx*spdx/spdmax
x = x + (2*spdx +keyRight*acc*delta_time -keyLeft*acc*delta_time+friction*delta_time)/2
spdx = spdx +keyRight*acc*delta_time -keyLeft*acc*delta_time



