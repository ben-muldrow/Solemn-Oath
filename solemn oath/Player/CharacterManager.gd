extends Node

signal change_hitbox(small)

enum CHARACTERS { 
	SKULL,
	OLD,
	DUCK,
	CHONK,
	ARCHER,
	KING
}

onready var charMap = {
	CHARACTERS.SKULL: $Skull,
	CHARACTERS.OLD: $Old,
	CHARACTERS.DUCK: $Duck,
	CHARACTERS.CHONK: $Chonk,
	CHARACTERS.ARCHER: $Archer,
	CHARACTERS.KING: $King
}

onready var Player = get_parent()

var currentChar: Character setget setChar, getChar

var idx = 0

func _ready():
	print(owner.name)
	changeCharacters(charMap[CHARACTERS.SKULL])

func changeCharacters(newChar: Character):
	if (newChar != null):
		if (currentChar != null):
			currentChar.onExit()
			if (newChar.useSmallHitbox != currentChar.useSmallHitbox):
				emit_signal("change_hitbox", newChar.useSmallHitbox)
		setChar(newChar)
		newChar.onEnter()

func setChar(newChar):
	currentChar = newChar

func getChar() -> Character:
	return currentChar

func getSprite():
	return currentChar.sprite

func doodoo():
	print('special')
	idx += 1
	changeCharacters(charMap[idx % 5])
	pass

func _on_Player_change_character():
	doodoo()
