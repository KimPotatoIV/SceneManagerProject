extends CanvasLayer

##################################################
const FADE_DELAY: float = 1.0

var fade_layer: ColorRect
var tween: Tween

var is_fading: bool = false

##################################################
func _ready() -> void:
	fade_layer = $FadeLayer
	
	fade_layer.modulate.a = 0.0
	fade_layer.visible = false

##################################################
func change_scene(res_value: String) -> void:
	if is_fading:
		print("Fading... Return")
		return
	
	is_fading = true
	
	fade_layer.visible = true
	
	tween = create_tween()
	tween.tween_property(fade_layer, "modulate:a", 1.0, FADE_DELAY)
	
	await tween.finished
	print("Fade Out Complete")
	
	await get_tree().change_scene_to_file(res_value)
	print("Scene Loading Complete")
	
	tween = create_tween()
	tween.tween_property(fade_layer, "modulate:a", 0.0, FADE_DELAY)
	
	await tween.finished
	print("Fade In Complete")
	
	fade_layer.visible = false
	is_fading = false
