extends MarginContainer

var inventory_size: int = 0;
var data: Array[Node] = [];
var expandable = false
var detractable = false

func _ready():
  var empty_spot_instance = preload ("res://assets/ui/inventory/empty_spot.tscn")
  var slot_node = $"Slots"
  
  for i in range(0, inventory_size):
    var node = empty_spot_instance.instantiate()
    data.append(node)
    slot_node.add_child(node)

  print(data, inventory_size)

func get_all_items():
  return data
