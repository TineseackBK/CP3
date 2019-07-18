# 模块：武器
# 激光
# 直线发射，碰撞舰艇后伴随少量颗粒效果
# 击中伤害：200
# 预装填

# 射击：F 键
execute at @s if entity @e[tag=module,tag=weapon,sort=nearest,limit=1,scores={cd_laser_p=200}] run tag @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:bone"}]}] add shoot_laser
	# cd
	execute at @s[tag=shoot_laser] run scoreboard players set @e[tag=module,tag=weapon,sort=nearest,limit=1] cd_laser_p 0

# 自动瞄准：确定 50 格内最近的舰艇或导弹类实体为目标（优先导弹类实体）
#execute at @s[tag=shoot_laser,tag=auto] unless entity @e[tag=target] run tag @e[tag=missile,distance=1..50,sort=nearest,limit=1] add target
#execute at @s[tag=shoot_laser,tag=auto] unless entity @e[tag=target] run tag @e[name=vessel,distance=1..50,sort=nearest,limit=1] add target
#execute at @s[tag=shoot_laser,tag=auto] at @e[tag=target,limit=1] run summon area_effect_cloud ~ ~ ~ {Duration:400,CustomName:"\"laserMk\""}
#tag @e[tag=target] remove target

# 依次生成三个基准实体并射向目标，particles 点动成线，aec 持续时间 10 s
execute at @s[tag=shoot_laser] run tag @e[tag=latest] remove latest
#execute at @s[tag=shoot_laser,tag=auto] facing entity @e[name=laserMk,limit=1] eyes run summon area_effect_cloud ^ ^ ^0.5 {CustomName:"\"laser\"",Tags:["latest"],Duration:400}
execute at @s[tag=shoot_laser,tag=!auto] run summon area_effect_cloud ^ ^ ^0.3 {CustomName:"\"laser\"",Tags:["latest","bullet"],Duration:400}

# bullet tag
tag @e[name=laser] add bullet
tag @e[name=laser,distance=..3] remove bullet

# tp + detect (三次)
#execute as @e[name=laser,tag=latest] at @s facing entity @e[name=laserMk,limit=1] eyes run tp @s ~ ~ ~ ~ ~
execute as @e[name=laser,tag=latest] at @s rotated as @p[tag=shoot_laser,tag=!auto] run tp @s ~ ~ ~ ~ ~
execute as @e[name=laser] at @s run tp @s ^ ^ ^2

#execute as @e[name=laser] at @s if entity @e[name=laserMk,distance=..3] run tag @s add hit_Mk
#execute as @e[name=laser,tag=hit_Mk] at @s run kill @e[name=laserMk,distance=..3]

# 伤害：200/发
execute as @e[name=laser] at @s if entity @e[tag=module,distance=..1.2] run tag @s add hit_vessel
execute as @e[name=laser,tag=hit_vessel] at @s if entity @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] run scoreboard players remove @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] hp 200
execute as @e[name=laser,tag=hit_vessel] at @s unless entity @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] run scoreboard players remove @e[tag=module,distance=..1.2,sort=nearest,limit=1] hp 200
execute as @e[name=laser,tag=hit_vessel] run kill @s

	# 方块撞击判定
	execute as @e[name=laser] at @s unless block ~ ~ ~ air run kill @s

	# particles
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^ 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-0.5 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-1 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-1.5 0 0 0 0.01 10 force

#execute as @e[name=laser,tag=latest] at @s facing entity @e[name=laserMk,limit=1] eyes run tp @s ~ ~ ~ ~ ~
execute as @e[name=laser,tag=latest] at @s rotated as @p[tag=shoot_laser,tag=!auto] run tp @s ~ ~ ~ ~ ~
execute as @e[name=laser] at @s run tp @s ^ ^ ^2

#execute as @e[name=laser] at @s if entity @e[name=laserMk,distance=..3] run tag @s add hit_Mk
#execute as @e[name=laser,tag=hit_Mk] at @s run kill @e[name=laserMk,distance=..3]

# 伤害：200/发
execute as @e[name=laser] at @s if entity @e[tag=module,distance=..1.2] run tag @s add hit_vessel
execute as @e[name=laser,tag=hit_vessel] at @s if entity @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] run scoreboard players remove @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] hp 200
execute as @e[name=laser,tag=hit_vessel] at @s unless entity @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] run scoreboard players remove @e[tag=module,distance=..1.2,sort=nearest,limit=1] hp 200
execute as @e[name=laser,tag=hit_vessel] run kill @s

	# 方块撞击判定
	execute as @e[name=laser] at @s unless block ~ ~ ~ air run kill @s

	# particles
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^ 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-0.5 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-1 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-1.5 0 0 0 0.01 10 force

#execute as @e[name=laser,tag=latest] at @s facing entity @e[name=laserMk,limit=1] eyes run tp @s ~ ~ ~ ~ ~
execute as @e[name=laser,tag=latest] at @s rotated as @p[tag=shoot_laser,tag=!auto] run tp @s ~ ~ ~ ~ ~
execute as @e[name=laser] at @s run tp @s ^ ^ ^2

#execute as @e[name=laser] at @s if entity @e[name=laserMk,distance=..3] run tag @s add hit_Mk
#execute as @e[name=laser,tag=hit_Mk] at @s run kill @e[name=laserMk,distance=..3]

# 伤害：200/发
execute as @e[name=laser] at @s if entity @e[tag=module,distance=..1.2] run tag @s add hit_vessel
execute as @e[name=laser,tag=hit_vessel] at @s if entity @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] run scoreboard players remove @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] hp 200
execute as @e[name=laser,tag=hit_vessel] at @s unless entity @e[name=vesselM,scores={hp=1..},distance=..1.2,sort=nearest,limit=1] run scoreboard players remove @e[tag=module,distance=..1.2,sort=nearest,limit=1] hp 200
execute as @e[name=laser,tag=hit_vessel] run kill @s

	# 方块撞击判定
	execute as @e[name=laser] at @s unless block ~ ~ ~ air run kill @s

	# particles
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^ 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-0.5 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-1 0 0 0 0.01 10 force
	execute at @e[name=laser] run particle minecraft:dust 0.6 0.5 0.9 0.8 ^ ^ ^-1.5 0 0 0 0.01 10 force
	
# reset
execute as @s[tag=shoot_laser] run clear @s minecraft:bone
execute as @s[tag=shoot_laser] run replaceitem entity @s hotbar.1 minecraft:bone
tag @s[tag=shoot_laser] remove shoot_laser