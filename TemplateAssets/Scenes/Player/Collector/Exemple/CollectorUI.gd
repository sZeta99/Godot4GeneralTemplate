extends Label
var coin = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text= "Coin Collected : "+str(coin)
	#Connect Signal item_collected to _on_item_collector_item_collected
	SignalEventBusSingleton.item_collected.connect(_on_item_collector_item_collected)
	pass # Replace with function body.

	#print_debug(self.is_connected("item_collected",_on_item_collector_item_collected))
func _on_item_collector_item_collected(item):
	coin = coin + 1
	self.text= "Coin Collected : "+str(coin)
	pass # Replace with function body.
