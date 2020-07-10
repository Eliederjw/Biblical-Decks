extends Control

var who_list = []
var time_list = []
var decks = ["Who_Deck", "Time_Deck"]
var lists = [who_list, time_list]

func _ready():
	for i in decks:
		fill_list(i, lists[decks.find(i)])
		shuffle_list(lists[decks.find(i)])
			
func fill_list(deck_name, list):
	var frame = $Deck_Sprite.get_sprite_frames().get_frame_count(deck_name)
	
	for i in frame:
		list.append(i)
	
	return list
		
func shuffle_list(list):
	randomize()
	list.shuffle()
	
func get_card(deck_name, list):
	if list.size() <= 0:
		fill_list(deck_name, list)
		shuffle_list(list)
	var card = list.pop_front()
	$Deck_Sprite.set_animation(deck_name)
	$Deck_Sprite.set_frame(card)
	$Deck_Sprite.play(deck_name)
	
func _on_bttTime_pressed():
	get_card("Time_Deck", time_list)

func _on_bttWho_pressed():
	get_card("Who_Deck", who_list)
