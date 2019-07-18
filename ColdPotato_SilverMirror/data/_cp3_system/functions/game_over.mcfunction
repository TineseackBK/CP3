# 系统：结束游戏

# 打扫战场
	# 清除舰艇实体
	kill @e[tag=vessel]
	
	# 清除子弹
	kill @e[name=plasma]
	kill @e[name=laser]
	kill @e[tag=missile]
	
	# 清除其他实体
	kill @e[name=vehicle]
	
# 处理数据
	# 处理玩家分数、tag、team
	clear @a
	team leave @a
	tag @a remove inGame
	tag @a remove inVessel
	tag @a remove mod_movement
	tag @a remove mod_weapon
	tag @a remove mod_observatory
	scoreboard players reset @a number
	
	# 处理 system 分数、tag
	scoreboard players reset @e[name=system] line
	scoreboard players set @e[name=system] start_timer 60
	tag @e[name=system] remove started_over
	
# tp 玩家到大厅
tp @a @e[name=lobby,limit=1]

# temp
tellraw @a ["",{"text":"\n\n   TEMP:游戏中止   \n\n"}]
