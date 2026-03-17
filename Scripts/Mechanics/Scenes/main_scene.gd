extends Node2D

var interactable_objects: Array
var main_timeline:= preload("res://Timelines/main_timeline.dtl")

var leeks_obtained:= 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		if i is Item:
			interactable_objects.append(i)
	item_manager.item_collected.connect(_on_item_collected)
	
	#Dialogic.start(main_timeline)

func _on_item_collected(i: Item) -> void:
	if i.item_type == "leek":
		leeks_obtained += 1
	print(leeks_obtained)
