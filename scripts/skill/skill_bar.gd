# res://scripts/skill/skill_bar.gd
extends HBoxContainer

signal skill_input(skill, slot_index)

@export var slots: Array[NodePath]
@export var keymap: Array[String] = ["1","2","3","4","5","6","7","8","9","0"]

var _slot_nodes := []

func _ready() -> void:
    _slot_nodes.clear()

    for i in range(slots.size()):
        var p = slots[i]
        var n = get_node_or_null(p)
        if n == null:
            continue

        _slot_nodes.append(n)

        # Slot index
        if "slot_index" in n:
            n.slot_index = i

        # Hotkey text (1–0 arası)
        if "hotkey_text" in n and i < keymap.size():
            n.hotkey_text = keymap[i]
            # Eğer slotta kendi refresh fonksiyonun varsa çağır
            if n.has_method("_refresh_visuals"):
                n._refresh_visuals()

        # Slotun triggered sinyalini skillbara bağla
        if not n.is_connected("triggered", Callable(self, "_on_slot_triggered")):
            n.connect("triggered", Callable(self, "_on_slot_triggered"))

func _input(event: InputEvent) -> void:
    if event is InputEventKey and event.pressed and not event.echo:
        var sc_str := OS.get_keycode_string(event.physical_keycode)
        var idx := keymap.find(sc_str)
        if idx != -1 and idx < _slot_nodes.size():
            var slot = _slot_nodes[idx]
            if slot and slot.has_method("try_trigger"):
                slot.try_trigger()

func _on_slot_triggered(skill, slot_index) -> void:
    skill_input.emit(skill, slot_index)

func start_cooldown(slot_index: int, seconds: float) -> void:
    if slot_index < 0 or slot_index >= _slot_nodes.size():
        return
    var slot = _slot_nodes[slot_index]
    if slot and slot.has_method("start_cooldown"):
        slot.start_cooldown(seconds)

func clear_all_slots() -> void:
    for i in range(_slot_nodes.size()):
        var s = _slot_nodes[i]
        if s and s.has_method("clear_skill"):
            s.clear_skill()
