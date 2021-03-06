
extends Area2D
tool

var path = 'res://graphics/food/'

export(String, "apple0", "burger0", "orange0", "pear0", "red_soda") var food = "apple0" setget _set_food
export var points = 50

var sprite = Sprite.new()
var shape = CollisionShape2D.new()


func _set_food( what ):
	var file = path+what+'.png'
	var tex = load(file)
	if tex:
		sprite.set_texture(tex)
		food = what
	else:
		OS.alert("What's a "+what+"?")

func _enter_tree():
	add_child(sprite)
	add_child(shape)
	
	var sh = CircleShape2D.new()
	sh.set_radius(7)
	shape.set_shape(sh)
	
	set('food',food)

func pickup():
	get_node('/root/GameState').add_food(points)
	queue_free()


