extends Control

var path = "res://data/Data.prn"
onready var items = $VBox/Items

func _ready():
	showItems(Get_data())
	

func Get_data():
	var maindata = {}
	var file = File.new()
	file.open(path, file.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		maindata[maindata.size()] = data_set
	file.close()
	print(maindata)
	return maindata

func showItems(data):
	items.visible = false
	for item in data.keys():
		var item_copy = items.duplicate()
		var entity : Dictionary = data[item]
		item_copy.text = str(entity[0]) + " " + str(entity[1]) + " " + str(entity[2]) + " " + str(entity[3])
		item_copy.visible = true
		$VBox.add_child(item_copy)










