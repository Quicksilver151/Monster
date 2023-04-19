extends CharacterBody2D

@export_range(0,250,2) var speed = 75


func _physics_process(delta):
	
	top_down_movement()
	
	if velocity.length() == 0:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walk")
	

func top_down_movement():
	
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = Vector2(x,y).normalized() * speed
	move_and_slide()
	



func _on_collect_area_area_entered(area):
	if area.is_in_group("collectable"):
		if area.name == "MonsterDrink":
			Global.energy += 1
		if area.name == "DrPepper":
			Global.health += 1
		area.queue_free()
