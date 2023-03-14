extends HSlider
#onready var slider = $HSlider
func _ready():
	self.value = geral.volume
	connect("value_changed", self, "_on_hslider_value_changed")
	
func _on_hslider_value_changed(value):
	geral.volume = value


