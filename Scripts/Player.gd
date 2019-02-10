extends KinematicBody2D

const SPEED = 750
const JUMP_SPEED = -1500
const GRAVITY = 3600
const UP = Vector2(0, -1)

var motion = Vector2(1,0)

var right
var left

func _process(delta):
	update_animation()

func _physics_process(delta):
	update_motion(delta)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	
	move_and_slide(motion, UP)

func run():
	right = Input.is_action_pressed("ui_right")
	left = Input.is_action_pressed("ui_left")
	
	if right and left:
		motion.x = 0
	elif right:
		motion.x = SPEED
	elif left:
		motion.x = -SPEED
	else:
		motion.x = 0
		
func fall(delta):
	if is_on_floor():
		motion.y= 0
	else:
		motion.y += GRAVITY * delta

func jump():
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		motion.y = JUMP_SPEED

func update_animation():
	$AnimatedSprite.updated(motion)