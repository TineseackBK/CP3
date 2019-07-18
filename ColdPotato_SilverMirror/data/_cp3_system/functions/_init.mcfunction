# 一些需要注意的 init 点
# name=system 的 Mk，保证有 tag=control_mouse / tag=control_keyboard
# 玩家 tag=inGame, tag=inVessel
# 玩家 number
# accelMk

# consts
scoreboard objectives add Const dummy
scoreboard players set -1 Const -1
scoreboard players set 2 Const 2
scoreboard players set 8 Const 8
scoreboard players set 10 Const 10
scoreboard players set 36000000 Const 36000000

# teams
team add Potatoy
team add Earth
team add Spectator
team add team_1
team add team_2
team add team_3
team add team_4
team add team_5
team add team_-1
team add team_-2
team add team_-3
team add team_-4
team add team_-5

team modify team_1 collisionRule never
team modify team_1 seeFriendlyInvisibles false
team modify team_1 color aqua

team modify team_2 collisionRule never
team modify team_2 seeFriendlyInvisibles false
team modify team_2 color gold

team modify team_3 collisionRule never
team modify team_3 seeFriendlyInvisibles false
team modify team_3 color green

team modify team_4 collisionRule never
team modify team_4 seeFriendlyInvisibles false
team modify team_4 color light_purple

team modify team_5 collisionRule never
team modify team_5 seeFriendlyInvisibles false
team modify team_5 color blue

team modify team_-1 collisionRule never
team modify team_-1 seeFriendlyInvisibles false
team modify team_-1 color dark_aqua

team modify team_-2 collisionRule never
team modify team_-2 seeFriendlyInvisibles false
team modify team_-2 color red

team modify team_-3 collisionRule never
team modify team_-3 seeFriendlyInvisibles false
team modify team_-3 color yellow

team modify team_-4 collisionRule never
team modify team_-4 seeFriendlyInvisibles false
team modify team_-4 color dark_purple

team modify team_-5 collisionRule never
team modify team_-5 seeFriendlyInvisibles false
team modify team_-5 color dark_blue

# objs
	# general
	scoreboard objectives add Shift minecraft.custom:minecraft.sneak_time
	
	# system
	scoreboard objectives add number dummy
	scoreboard objectives add stat_total dummy
	scoreboard objectives add stat_pot dummy
	scoreboard objectives add stat_ear dummy
	scoreboard objectives add stat_spe dummy
	scoreboard objectives add line dummy
	scoreboard objectives add start_timer dummy
	
	# movement
	scoreboard objectives add accel dummy
	scoreboard objectives add MotionX dummy
	scoreboard objectives add MotionY dummy
	scoreboard objectives add MotionZ dummy
	scoreboard objectives add MotionXT dummy
	scoreboard objectives add MotionYT dummy
	scoreboard objectives add MotionZT dummy
	scoreboard objectives add brakeTimer dummy
	scoreboard objectives add RotationX dummy
	scoreboard objectives add RotationY dummy
	scoreboard objectives add RotationXT dummy
	scoreboard objectives add RotationYT dummy
	
	# observatory
	scoreboard objectives add zoom dummy
	
	# weapon
	scoreboard objectives add shield_timer dummy
	scoreboard objectives add cd_plasma dummy
	scoreboard objectives add cd_plasma_p dummy
	scoreboard objectives add cd_laser dummy
	scoreboard objectives add cd_laser_p dummy
	scoreboard objectives add cd_nuclear dummy
	
	
	# data
	scoreboard objectives add hp dummy
	
# Mk
	# system
	scoreboard players set @e[name=system] start_timer 60

	# movement
	kill @e[name=accelMk]
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["1"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["2"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["3"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["4"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["5"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["-1"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["-2"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["-3"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["-4"]}
	summon area_effect_cloud 0.0 0.0 0.0 {Duration:2100000000,CustomName:"\"accelMk\"",Tags:["-5"]}