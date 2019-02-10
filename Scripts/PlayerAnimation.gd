extends AnimatedSprite

func updated(motion):
	if motion.y < 0:
		play("Jump")
	elif motion.x > 0:
		play("Run")
		flip_h = false
	elif motion.x < 0:
		play("Run")
		flip_h = true
	else:
		play("Idle")
		flip_h = false