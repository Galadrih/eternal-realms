extends Node2D
class_name BlacksmithNPC

@onready var area: Area2D = $Area2D
@onready var interaction_label: Label = $InteractionLabel

var player_in_range: bool = false

func _ready() -> void:
	interaction_label.visible = false
	area.body_entered.connect(_on_area_body_entered)
	area.body_exited.connect(_on_area_body_exited)


func _on_area_body_entered(body: Node) -> void:
	if body.is_in_group("player_character"):
		player_in_range = true
		interaction_label.visible = true


func _on_area_body_exited(body: Node) -> void:
	if body.is_in_group("player_character"):
		player_in_range = false
		interaction_label.visible = false

		# Alan dışına çıkınca paneli otomatik kapat
		var panel = get_tree().get_first_node_in_group("blacksmith_panel")
		if panel:
			if panel.has_method("close_panel"):
				panel.close_panel()
			elif panel.has_method("force_close"):
				panel.force_close()



func _input(event: InputEvent) -> void:
	# "interact" input action'ını Project Settings → Input Map'te ekle
	# Örn: "interact" = tuş E
	if player_in_range and event.is_action_pressed("interact"):
		_open_blacksmith_panel()


func _open_blacksmith_panel() -> void:
	var panel = get_tree().get_first_node_in_group("blacksmith_panel")
	if panel and panel.has_method("open_panel") and panel.has_method("close_panel"):
		if panel.visible:
			panel.close_panel()
		else:
			panel.open_panel()
	elif panel and panel.has_method("open_panel"):
		panel.open_panel()
	else:
		print("Blacksmith panel bulunamadı ya da open_panel() yok.")
