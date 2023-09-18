extends Node2D

var laser_scene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(_body):
	print('player entered gate from level!')

func _on_player_laser(pos: Vector2, dir: Vector2):
	
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.rotation = dir.angle()
	laser.direction = dir
	
	$Projectiles.add_child(laser)

func _on_player_grenade(pos: Vector2, dir: Vector2):
	
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.rotation = dir.angle()
	grenade.linear_velocity = dir * grenade.speed
	
	$Projectiles.add_child(grenade)
