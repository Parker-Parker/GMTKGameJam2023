/// @description Insert description here
// You can write your code in this editor

maxspeed = 8
xlr8 = 2

xspeed = 0
yspeed = 0

path = [[x,y]]
path_resolution = 100
path_length = 30

last_location = [[x,y]]
last_location_resolution = 1
last_location_length = 20

a_star_grid = mp_grid_create(0, 0, 100, 100, 50, 50)

hp = 100