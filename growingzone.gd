extends StaticBody2D

var plant = Global.plantselected
var plantgrowing = false
var plant_grown = false

func _physics_process(delta):
	if plantgrowing == false:
		plant = Global.plantselected

func _on_Area2D_area_entered(area):
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$carrotgrowtimer.start()
			$plant.play("carrotgrowing")
		if plant == 2:
			plantgrowing = true;
			$oniongrowtimer.start()
			$plant.play("oniongrowing")
		if plant == 3:
			plantgrowing = true;
			$corngrowtimer.start()
			$plant.play("corngrowing")
		if plant == 4:
			plantgrowing = true;
			$berrygrowtimer.start()
			$plant.play("berrygrowing")
	else:
		print("Algo já está plantado nesse terreno!")

func _on_carrotgrowtimer_timeout():
	var carrot_plant = $plant
	
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrotgrowtimer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true

func _on_oniongrowtimer_timeout():
	var onion_plant = $plant
	
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$oniongrowtimer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grown = true
		
func _on_corngrowtimer_timeout():
	var corn_plant = $plant
	
	if corn_plant.frame == 0:
		corn_plant.frame = 1
		$corngrowtimer.start()
	elif corn_plant.frame == 1:
		corn_plant.frame = 2
		plant_grown = true

func _on_berrygrowtimer_timeout():
	var berry_plant = $plant
	
	if berry_plant.frame == 0:
		berry_plant.frame = 1
		$berrygrowtimer.start()
	elif berry_plant.frame == 1:
		berry_plant.frame = 2
		plant_grown = true

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.numofcarrots += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Global.numofonions += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 3:
				Global.numofcorns += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 4:
				Global.numofberrys += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			else:
				pass
