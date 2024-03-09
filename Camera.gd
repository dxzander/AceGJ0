extends Node3D

var rotation_speed: float = 0.1
var curTar := Vector3(0, 0, 0)
var realTar := Vector3(0, 0, 0)
var lerpedTar := Vector3(0, 0, 0)
var cam_default_position := Vector3(0,11,22)

@export var target = Node3D
@export var player = Node3D

func _physics_process(delta):
	global_position = player.global_position + player.get_up()
	realTar = target.global_position
	lerpedTar = curTar.lerp(realTar, rotation_speed)
	look_at(lerpedTar, player.get_up())
	curTar = lerpedTar
	if $RayCam.is_colliding():
		$Cam.global_position = $RayCam.get_collision_point() * 0.9
	else:
		$Cam.position = cam_default_position
