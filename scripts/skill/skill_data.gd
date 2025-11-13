# res://scripts/skill/skill_data.gd
extends Resource
class_name SkillData

@export var id: StringName
@export var display_name: String = ""
@export var icon: Texture2D
@export var mana_cost: int = 0
@export var cooldown: float = 1.0
@export_multiline var description: String = ""
@export_enum("instant","targeted","self","channeled") var cast_type: String = "instant"
