extends StaticBody2D

#item 1 = berry 2 = randomseed 3 = corn
var item = 1

var item1price = 100
var item2price = 200
var item3price = 350

var item1owned = false
var item2owned = false
var item3owned = false

var price

func _ready():
	$icon.play("berryseed")
	item = 1

func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$icon.play("berryseed")
			$pricelabel.text = "100"
			
			if Global.coins >= item1price:
				if item1owned == false:
					$buybuttoncolor.color = "353ad31a" #green
				else:
					$buybuttoncolor.color = "5a3131" #red
			else:
				$buybuttoncolor.color = "5a3131" #red
		if item == 2:
			$icon.play("randomseed")
			$pricelabel.text = "200"
			
			if Global.coins >= item2price:
				if item2owned == false:
					$buybuttoncolor.color = "353ad31a" #green
				else:
					$buybuttoncolor.color = "5a3131" #red
			else:
				$buybuttoncolor.color = "5a3131" #red
		if item == 3:
			$icon.play("cornseed")
			$pricelabel.text = "350"
			
			if Global.coins >= item3price:
				if item3owned == false:
					$buybuttoncolor.color = "353ad31a" #green
				else:
					$buybuttoncolor.color = "5a3131" #red
			else:
				$buybuttoncolor.color = "5a3131" #red

func _on_buttonleft_pressed():
	swap_item_back()

func _on_buttonright_pressed():
	swap_item_forward()

func _on_buybutton_pressed():
	if item == 1:
		price = item1price
		if Global.coins >= price:
			if item1owned == false:
				buy()
	elif item == 2:
		price = item2price
		if Global.coins >= price:
			if item2owned == false:
				buy()
	elif item == 3:
		price = item3price
		if Global.coins >= price:
			if item3owned == false:
				buy()

func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 1

func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 1

func buy():
	Global.coins -= price
	if item == 1:
		item1owned = true
	if item == 2:
		item2owned = true
	if item == 3:
		item3owned = true
