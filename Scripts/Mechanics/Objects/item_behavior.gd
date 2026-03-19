extends Node
class_name Item

var grab_mouse_icon:= preload("res://Assets/Placeholder/Cursors/cursor_grab.png")
var grabbing_mouse_icon:= preload("res://Assets/Placeholder/Cursors/cursor_grabbing.png")
var default_mouse_icon:= preload("res://Assets/Placeholder/Cursors/cursor_default.png")

@export var item_type:= "leek"

signal item_collected(i_type: Item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _change_cursor() -> void:
	Input.set_custom_mouse_cursor(grab_mouse_icon)
	
func _reset_cursor() -> void:
	Input.set_custom_mouse_cursor(default_mouse_icon)

func object_is_held(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("interact_with_items"):
		Input.set_custom_mouse_cursor(grabbing_mouse_icon)
		item_collected.emit(self)
		queue_free()
		Input.set_custom_mouse_cursor(default_mouse_icon)
