extends Node2D

var interactable_objects: Array

var leeks_obtained:= 0

var cur_timeline: DialogicTimeline

var timeline_playing:= false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	
	Dialogic.start("main_timeline")
	
	for i in get_children():
		if i is Item:
			interactable_objects.append(i)
			i.item_collected.connect(_on_item_collected)

func _process(delta: float) -> void:
	if Dialogic.VAR.main_vars.got_leeks and !timeline_playing:
		Dialogic.start("miku_rescued_timeline")
		
func _on_item_collected(i: Item) -> void:
	if i.item_type == "leek":
		leeks_obtained += 1
		if leeks_obtained >= 2:
			Dialogic.VAR.main_vars.set("got_leeks", true)

func _on_timeline_started() -> void:
	cur_timeline = Dialogic.current_timeline
	timeline_playing = true
	print("'", cur_timeline.get_identifier(), "'", " começou: ", timeline_playing)
	
func _on_timeline_ended() -> void:
	timeline_playing = false
	Dialogic.VAR.reset()
	print("'", cur_timeline.get_identifier(), "'", " terminou: ", !timeline_playing)
