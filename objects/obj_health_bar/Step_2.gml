/// @description Health Bar


// Check if an instance of the enemy exists
if (instance_exists(my_enemy)) 
{
	// Scale the length of the health bar using the custom map value function
	health_bar_width = map_value(my_enemy.hp, 0, my_enemy.max_hp, 0, sprite_width);
	
	// Update the health bar's x and y values using its enemy's x and y values plus its offsets
	x = my_enemy.x + x_offset;
	y = my_enemy.y + y_offset;
	
	// Set the depth of the health bar to be the same as the enemies depth
	depth = -my_enemy.y;
} 
// If no instance of the enemy exists
else 
{
	// Destroy this health bar
	instance_destroy(id);
}


