/// @description Health Bar

// Draw the health bar's sprite. This is the back of the health bar
draw_self();

// Use the built in draw_sprite_part function to draw as much of the health bar as health remains
draw_sprite_part(spr_enemy_health_front, 0, 0, 0, health_bar_width, sprite_height, x, y);

