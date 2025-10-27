#extends CPUParticles2D

#func _process(delta):
	#if Input.get_action_strength("shift"):
		#$CPUParticles2D.emitting = true
