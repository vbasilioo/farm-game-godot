extends StaticBody2D

func _on_Area2D_body_entered(body):
	if body.has_method("player_sell_method"):
		var carrots = Global.numofcarrots
		var onions = Global.numofonions
		var corns = Global.numofcorns
		var berrys = Global.numofberry
		var coins = Global.coins
		
		#carrots = 5 coins | onions = 8 coins | corns = 20 | berrys = 14
		
		coins += carrots * 5
		coins += onions * 8
		coins += corns * 20
		coins += berrys * 14
		
		carrots = 0 
		onions = 0
		corns = 0
		berrys = 0
		
		Global.coins = coins
		Global.numofcarrots = carrots
		Global.numofonions = onions
		Global.numofcorns = corns
		Global.numofberrys = berrys
