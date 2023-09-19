extends CharacterBody2D

var Bullet = load("res://Enemy/Enemy_Bullet.tscn")




func _on_timer_timeout():
	var Player = get_node_or_null("/root/Game/Player_Container/Player")
	var Effects = get_node_or_null("/root/Game/Effects")
	if Player != null and Effects != null:
		var bullet = Bullet.instantiate()
		var d = global_position.angle_to_point(Player.global_position) + PI/2
		bullet.rotaiton = d
		bullet.global_position = global_position + Vector2(0,-40).rotated(d)
		Effects.add_child(bullet)



func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.damage(100)
