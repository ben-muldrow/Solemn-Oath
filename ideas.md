# Solemn Oath

Base mechanics:
- platformer
- class-based
- adventure / puzzler
- death? timer? soul counter?


Goal / motivation:
- deliver [ x ] beings to the presense in exchange for life
- to find all [ x ], you must use the abilities of them

Classes:
- old
  - charisma
  - poor movement, no jump, no combat, low health
  - is effectively useless, but can talk to people
- duck
  - flight
  - can flutter, decent jump, low health
- chonker
  - health
  - low mobility, high health, no combat, no jump
- archer
  - mage
  - high mobility, high jump, no combat, low health
- the King
  - the chosen one
  - will only speak to 'old'


puzzles that must be solved:
- riddle / charisma check:
  - old
- fit in small space
  - duck
- reach up high
  - duck
- shoot targets
  - archer
- kill enemies
  - archer
- survive hits
  - chonker
- push heavy
  - chonker
- convince king
  - old

ending:
- once all 5 beings have been returned to the presence, you are given life

map sequence:
- entrance. no turning back.
- charisma check or riddle to unlock duck
- open area, small opening
- ledge
- button target
- heavy boulder
- heavy door
- enemy
- king's room

questions
- should you be able to switch characters at any point? or have to die?
  - switching at any point would be less repetative
  - i like the idea of incentivising death
- when you swap characters, do you restart at the beginning?
  - alternative would be to swap at the current position


features
- file IO
  - dialog
  - save state
- platformer movement
  - platformer fall handicap
  - hop / glide
- general UI
  - UI for selecting soul
- levels (tutorial -> world)

Priorities:
- [ x ] set up tilemap
- set up player scene
  - soul manager (each soul is a different "state")
  - [ x ]state manager ( movement )
  - [ x ]animation player
    - animate sprites via rotation
- [ x ]set up camera
- world design
  - [ x ]tutorial
  - main world
- dialog
  - file I/O
  - serializing player state
  - read from dialog tree

Puzzles:
- The riddle (first challenge)
  - TBD