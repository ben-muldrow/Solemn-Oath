extends Node

const MAX_STATE_STACK = 5

onready var statesMap = {
	"IDLE": $Idle,
	"WALK": $Walk,
	"JUMP": $Jump
}

export var stateStack = []
var currentState: State setget setCurrentState, getCurrentState

# always default to idle state on ready
func _ready():
	changeState(statesMap.IDLE)

func changeState(nextState):
	# add to stack history
	if (currentState != nextState):
		if (currentState != null):
			currentState.onExit()
		currentState = nextState
		currentState.onEnter()
		stateStack.push_front(nextState)
		if (stateStack.size() > MAX_STATE_STACK):
			stateStack.pop_back()
	pass

func _on_InputManager_player_jump():
	if (currentState == statesMap.JUMP):
		currentState.handleInput()
	else:
		changeState(statesMap.JUMP)

func _on_InputManager_player_move(direction):
	match currentState:
		statesMap.IDLE:
			if (direction != Vector2.ZERO):
				changeState(statesMap.WALK)
			pass
		statesMap.WALK:
			currentState.direction = direction
			pass
		statesMap.JUMP:
			currentState.direction = direction
			pass
		_:
			pass
	pass

func getCurrentState() -> State:
	return currentState

func setCurrentState(state: State):
	changeState(state)
	pass

func _on_Walk_complete():
	changeState(statesMap.IDLE)

func _on_Jump_complete():
	changeState(statesMap.IDLE)
