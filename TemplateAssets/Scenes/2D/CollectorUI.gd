extends Label

var coin = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var collector = $"../TopDownCharacterController"
	collector = collector.find_child("ItemCollector")
	collector.item_collected.connect(collect)
	self.text = "Coin Collected : "+ str(coin)
	
	pass # Replace with function body.

func collect(item):
	coin = coin + 1
	self.text= "Coin Collected : "+str(coin)
	pass
	
