extends ProgressBar

var parent
var min_value_amount
var max_value_amount

func _ready():
	parent = get_parent()
	max_value_amount = parent.health_max
	min_value_amount = parent.health_min

func _process(delta):
	self.value = parent.health
	if parent.health != max_value_amount:
		self.visible = true
		if parent.health == min_value_amount:
			self.visible = false
	else:
		self.visible = false
	
#@onready var timer = $Timer
#@onready var damage_bar = $damagebar
#
#var health = 0 : set = _set_health
#
#func _set_health(new_health):
	#var prev_health = health
	#health = min(max_value, new_health)
	#value = health
	#
	#if health <= 0:
		#queue_free()
	#
	#if health < prev_health:
		#timer.start()
	#else:
		#damage_bar.value = health
#
#func init_health(_health):
	#health = _health
	#max_value = _health
	#value = _health
	#damage_bar.max_value = health
	#damage_bar.value = health
#
#func _on_timer_timeout() -> void:
	#damage_bar.value = health
