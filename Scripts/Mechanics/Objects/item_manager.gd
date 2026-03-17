extends Node
class_name Item_manager

@export var item_type: String
@export var item_value: int

signal item_collected(i_type: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
