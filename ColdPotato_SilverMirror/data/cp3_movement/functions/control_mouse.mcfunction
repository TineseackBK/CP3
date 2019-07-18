# 模块：舰艇移动
# 操控 - 鼠标操控
# module tag: mod_movement

# 获取玩家朝向
execute as @a[tag=inGame,tag=mod_movement] store result score @s RotationX run data get entity @s Rotation[0] 100000
execute as @a[tag=inGame,tag=mod_movement] store result score @s RotationY run data get entity @s Rotation[1] 100000

	# 特性补偿：强行把玩家朝向范围卡死在 [-180, 180]	
	execute as @a[scores={RotationX=18000001..},tag=inGame,tag=mod_movement] at @s run scoreboard players operation @s RotationX -= 36000000 Const
	execute as @a[scores={RotationX=..-18000001},tag=inGame,tag=mod_movement] at @s run scoreboard players operation @s RotationX += 36000000 Const

# 获取 vessel 朝向
execute as @e[name=vessel] store result score @s RotationX run data get entity @s Rotation[0] 100000
execute as @e[name=vessel] store result score @s RotationY run data get entity @s Rotation[1] 100000

# 记录朝向差值
execute as @e[name=vessel] at @s run scoreboard players operation @s RotationXT = @s RotationX
execute as @e[name=vessel] at @s run scoreboard players operation @s RotationXT -= @p RotationX
execute as @e[name=vessel] at @s run scoreboard players operation @s RotationYT = @s RotationY
execute as @e[name=vessel] at @s run scoreboard players operation @s RotationYT -= @p RotationY

# X: 若差值在 1 到 180 度之间，或小于 -180 度，则逆时针转
# X: 若差值在 -180 到 -1 度之间，或大于 180 度，则顺时针转
# Y: 若差值大于 1 度，向下转
# Y: 若差值小于 -1 度，向上转

execute as @e[name=vessel] at @s run data merge entity @s {Pose:{Head:[0f,0f,0f]}}

	# accel: 0
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=0}] at @s run tp @s ~ ~ ~ ~-0.5 ~

	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=0}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=0}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=0}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=0}] at @s run tp @s ~ ~ ~ ~ ~-0.5

	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=0}] at @s run tp @s ~ ~ ~ ~ ~0.5
	
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=0}] at @s run tp @s ~ ~ ~ ~ ~-0.5

	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=0}] at @s run tp @s ~ ~ ~ ~ ~0.5

		# 转向效果
		execute as @e[name=vessel,scores={RotationXT=50000..18000000,accel=0}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationXT=-18000000..-50000,accel=0}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=18000000..,accel=0}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=0}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationY=500000..,accel=0}] at @s run data merge entity @s {Pose:{Head:[20f,0f,0f]}}
		execute as @e[name=vessel,scores={RotationY=..-500000,accel=0}] at @s run data merge entity @s {Pose:{Head:[-20f,0f,0f]}}

	# accel: 1
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=1}] at @s run tp @s ~ ~ ~ ~-0.5 ~

	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=1}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=1}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=1}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=1}] at @s run tp @s ~ ~ ~ ~ ~-0.5

	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=1}] at @s run tp @s ~ ~ ~ ~ ~0.5
	
		# 转向效果
		execute as @e[name=vessel,scores={RotationXT=50000..18000000,accel=1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationXT=-18000000..-50000,accel=1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=18000000..,accel=1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationY=500000..,accel=1}] at @s run data merge entity @s {Pose:{Head:[20f,0f,0f]}}
		execute as @e[name=vessel,scores={RotationY=..-500000,accel=1}] at @s run data merge entity @s {Pose:{Head:[-20f,0f,0f]}}

	# accel: 2
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=2}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=2}] at @s run tp @s ~ ~ ~ ~-0.5 ~

	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=2}] at @s run tp @s ~ ~ ~ ~0.5 ~
	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=2}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=2}] at @s run tp @s ~ ~ ~ ~0.5 ~
	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=2}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=2}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=2}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=2}] at @s run tp @s ~ ~ ~ ~ ~-0.5
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=2}] at @s run tp @s ~ ~ ~ ~ ~-0.5

	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=2}] at @s run tp @s ~ ~ ~ ~ ~0.5
	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=2}] at @s run tp @s ~ ~ ~ ~ ~0.5
	
		# 转向效果
		execute as @e[name=vessel,scores={RotationXT=100000..18000000,accel=2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationXT=-18000000..-100000,accel=2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=18000000..,accel=2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationY=500000..,accel=2}] at @s run data merge entity @s {Pose:{Head:[20f,0f,0f]}}
		execute as @e[name=vessel,scores={RotationY=..-500000,accel=2}] at @s run data merge entity @s {Pose:{Head:[-20f,0f,0f]}}

	# accel: 3
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=3}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=3}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=3}] at @s run tp @s ~ ~ ~ ~-0.5 ~

	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=3}] at @s run tp @s ~ ~ ~ ~0.5 ~
	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=3}] at @s run tp @s ~ ~ ~ ~0.5 ~
	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=3}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=3}] at @s run tp @s ~ ~ ~ ~0.5 ~
	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=3}] at @s run tp @s ~ ~ ~ ~0.5 ~
	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=3}] at @s run tp @s ~ ~ ~ ~0.5 ~

	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=3}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=3}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=3}] at @s run tp @s ~ ~ ~ ~-0.5 ~
	
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=3}] at @s run tp @s ~ ~ ~ ~ ~-0.5
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=3}] at @s run tp @s ~ ~ ~ ~ ~-0.5
	execute as @e[name=vessel,scores={RotationYT=50000..,accel=3}] at @s run tp @s ~ ~ ~ ~ ~-0.5

	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=3}] at @s run tp @s ~ ~ ~ ~ ~0.5
	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=3}] at @s run tp @s ~ ~ ~ ~ ~0.5
	execute as @e[name=vessel,scores={RotationYT=..-50000,accel=3}] at @s run tp @s ~ ~ ~ ~ ~0.5
	
		# 转向效果
		execute as @e[name=vessel,scores={RotationXT=150000..18000000,accel=3}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationXT=-18000000..-150000,accel=3}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=18000000..,accel=3}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=3}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationY=500000..,accel=3}] at @s run data merge entity @s {Pose:{Head:[20f,0f,0f]}}
		execute as @e[name=vessel,scores={RotationY=..-500000,accel=3}] at @s run data merge entity @s {Pose:{Head:[-20f,0f,0f]}}

	# accel: -1
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=-1}] at @s run tp @s ~ ~ ~ ~-0.4 ~

	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=-1}] at @s run tp @s ~ ~ ~ ~0.4 ~

	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=-1}] at @s run tp @s ~ ~ ~ ~0.4 ~

	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=-1}] at @s run tp @s ~ ~ ~ ~-0.4 ~
	
	execute as @e[name=vessel,scores={RotationYT=40000..,accel=-1}] at @s run tp @s ~ ~ ~ ~ ~-0.4

	execute as @e[name=vessel,scores={RotationYT=..-40000,accel=-1}] at @s run tp @s ~ ~ ~ ~ ~0.4
	
		# 转向效果
		execute as @e[name=vessel,scores={RotationXT=50000..18000000,accel=-1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationXT=-18000000..-50000,accel=-1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=18000000..,accel=-1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=-1}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationY=500000..,accel=-1}] at @s run data merge entity @s {Pose:{Head:[20f,0f,0f]}}
		execute as @e[name=vessel,scores={RotationY=..-500000,accel=-1}] at @s run data merge entity @s {Pose:{Head:[-20f,0f,0f]}}
	
	# accel: -2
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=-2}] at @s run tp @s ~ ~ ~ ~-0.4 ~
	execute as @e[name=vessel,scores={RotationXT=10..18000000,accel=-2}] at @s run tp @s ~ ~ ~ ~-0.4 ~

	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=-2}] at @s run tp @s ~ ~ ~ ~0.4 ~
	execute as @e[name=vessel,scores={RotationXT=-18000000..-10,accel=-2}] at @s run tp @s ~ ~ ~ ~0.4 ~

	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=-2}] at @s run tp @s ~ ~ ~ ~0.4 ~
	execute as @e[name=vessel,scores={RotationXT=18000000..,accel=-2}] at @s run tp @s ~ ~ ~ ~0.4 ~

	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=-2}] at @s run tp @s ~ ~ ~ ~-0.4 ~
	execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=-2}] at @s run tp @s ~ ~ ~ ~-0.4 ~
	
	execute as @e[name=vessel,scores={RotationYT=40000..,accel=-2}] at @s run tp @s ~ ~ ~ ~ ~-0.4
	execute as @e[name=vessel,scores={RotationYT=40000..,accel=-2}] at @s run tp @s ~ ~ ~ ~ ~-0.4

	execute as @e[name=vessel,scores={RotationYT=..-40000,accel=-2}] at @s run tp @s ~ ~ ~ ~ ~0.4
	execute as @e[name=vessel,scores={RotationYT=..-40000,accel=-2}] at @s run tp @s ~ ~ ~ ~ ~0.4
	
		# 转向效果
		execute as @e[name=vessel,scores={RotationXT=100000..18000000,accel=-2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationXT=-18000000..-100000,accel=-2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=18000000..,accel=-2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,-20f]}}
		execute as @e[name=vessel,scores={RotationXT=..-18000000,accel=-2}] at @s run data merge entity @s {Pose:{Head:[0f,0f,20f]}}
		execute as @e[name=vessel,scores={RotationY=500000..,accel=-2}] at @s run data merge entity @s {Pose:{Head:[20f,0f,0f]}}
		execute as @e[name=vessel,scores={RotationY=..-500000,accel=-2}] at @s run data merge entity @s {Pose:{Head:[-20f,0f,0f]}}
	

# 5 - 刹车
execute as @a[nbt={SelectedItemSlot:4},tag=inGame,tag=mod_movement] run tag @s add brake
execute as @a[tag=brake] run scoreboard players set @e[name=vessel,sort=nearest,limit=1] accel 0
execute as @a[tag=!brake] run scoreboard players remove @s brakeTimer 2
execute as @a[tag=!brake,scores={brakeTimer=..0}] run scoreboard players set @s brakeTimer 0
execute as @a[tag=brake] run scoreboard players add @s brakeTimer 1
execute as @a[scores={brakeTimer=20..}] run function cp3_movement:brake
execute as @a[scores={brakeTimer=20..}] run scoreboard players set @s brakeTimer 0

# 7/F - 提升1档
execute as @a[nbt={SelectedItemSlot:7,Inventory:[{Slot:-106b,id:"minecraft:music_disc_13"}]},tag=inGame,tag=mod_movement] run tag @s add speed_up
execute at @a[tag=speed_up] run scoreboard players add @e[name=vessel,sort=nearest,limit=1] accel 1
execute as @a[tag=speed_up] run clear @s minecraft:music_disc_13
execute as @a[tag=speed_up] run replaceitem entity @s hotbar.7 minecraft:music_disc_13

# 8/F - 降低1档
execute as @a[nbt={SelectedItemSlot:8,Inventory:[{Slot:-106b,id:"minecraft:music_disc_11"}]},tag=inGame,tag=mod_movement] run tag @s add speed_down
execute at @a[tag=speed_down] run scoreboard players remove @e[name=vessel,sort=nearest,limit=1] accel 1
execute as @a[tag=speed_down] run clear @s minecraft:music_disc_11
execute as @a[tag=speed_down] run replaceitem entity @s hotbar.8 minecraft:music_disc_11

# reset
tag @a remove speed_up
tag @a remove speed_down
