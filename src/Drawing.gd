extends NinePatchRect

func set_parameters(image, position: Vector2):
	self.set_position(position)
	self.texture = image
