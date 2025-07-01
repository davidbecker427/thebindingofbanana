extends ProgressBar

var parent
var min_value_amount
var max_value_amount

# fetching the values set in the parent
func _ready():
	parent = get_parent()
	max_value_amount = parent.health_max
	min_value_amount = parent.health_min

# healthbar needs to match the parent health variable
# hide the healthbar if its at full health
func _process(delta):
	self.value = parent.health
	if parent.health != max_value_amount:
		self.visible = true
		if parent.health == min_value_amount:
			self.visible = false
	else:
		self.visible = false
	
