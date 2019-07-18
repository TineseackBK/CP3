# 数据：耐久值
# 如下物品有耐久值：
# 舰艇核心
# 舰艇护甲
# 舰艇模块：移动模块 / 武器模块 / 瞭望模块
# 舰艇引擎
# 能量护盾
# 制导鱼雷

# obj: hp

# 血量下限
scoreboard players set @e[scores={hp=..0}] hp 0

# 舰艇核心
	# 每艘舰艇的核心部位，位于舰艇中心，耐久值：10000
	# 可被以下物品损伤：所有
	# 不可修复
	
	# 受到攻击：已经写入各个武器内
	
	# 半血告急：
	execute as @a[tag=inGame] if score @s number = @e[name=vessel,tag=core,scores={hp=1000..5000},tag=!medium_hp,limit=1] number run tellraw @s ["",{"text":"\n [WARNING]\n","color":"red","bold":true},{"text":"\n 舰艇耐久","color":"gray"},{"text":"不足一半\n","color":"gold","bold":true}]
	tag @e[name=vessel,tag=core,scores={hp=1000..5000}] add medium_hp
	
	# 低血告急：
	execute as @a[tag=inGame] if score @s number = @e[name=vessel,tag=core,scores={hp=..1000},tag=!low_hp,limit=1] number run tellraw @s ["",{"text":"\n [WARNING]\n","color":"red","bold":true},{"text":"\n 舰艇耐久","color":"gray"},{"text":"告急！\n","color":"dark_red","bold":true}]
	tag @e[name=vessel,tag=core,scores={hp=..1000}] add low_hp
	
	# 当耐久降至 0：舰船炸毁，自身携带的所有模块炸毁，船员全部死亡
	execute as @e[name=vessel,tag=core,scores={hp=..0}] at @s run particle minecraft:explosion_emitter ~ ~ ~ 0.5 0.5 0.5 0 5 normal
	#execute as @e[name=vessel,tag=core,scores={hp=..0}] at @s run playsound
	execute as @e[name=vessel,tag=core,scores={hp=..0}] at @s run kill @e[name=vehicle,distance=..1]
	execute as @e[name=vessel,tag=core,scores={hp=..0}] at @s run kill @a[tag=inGame,distance=..3]
	execute as @a[tag=inGame] if score @s number = @e[name=vessel,tag=core,scores={hp=..0},limit=1] number run kill @s
	execute as @e[name=vessel,tag=core,scores={hp=..0}] at @s run kill @e[tag=module,distance=..3]
	
# 舰艇护甲
	# 每艘舰艇的外壳，优先受到伤害，耐久值：1000~5000
	# 可被以下物品损伤：所有
	# 自动缓慢修复
	
	# 受到攻击：已经写入各个武器内
	
	# 自动修复：已经写入 weapon:shield
	
	# 低血告急：
	execute as @a[tag=inGame] if score @s number = @e[name=vesselM,scores={hp=..200},tag=!low_hp,limit=1] number run tellraw @s ["",{"text":"\n [WARNING]\n","color":"red","bold":true},{"text":"\n 舰艇护甲","color":"gray"},{"text":"低\n","color":"dark_red","bold":true}]
	tag @e[name=vesselM,scores={hp=..200}] add low_hp
	
	# 当耐久降至 0：释放一个冲击波，推开半径 10 格内所有舰艇并造成 200 点伤害
	tag @e[name=vesselM,scores={hp=..0},tag=!no_hp] add exploding
	
	execute as @e[name=vesselM,scores={hp=..0},tag=!no_hp] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] run summon minecraft:firework_rocket ~ ~ ~ {"Silent":1b,"FireworksItem":{"id":"minecraft:firework_rocket","Count":1b,"tag":{"Fireworks":{"Explosions":[{"Colors":[I;4917],"Type":1b,"Trail":0b},]}}}}
	
	execute as @e[name=vesselM,scores={hp=..0},tag=!no_hp] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] if entity @e[name=vesselM,tag=!exploding,scores={hp=1..},distance=2..10] run scoreboard players remove @e[name=vesselM,tag=!exploding,scores={hp=1..},distance=2..10] hp 200
	execute as @e[name=vesselM,scores={hp=..0},tag=!no_hp] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] as @e[name=vesselM,tag=!exploding,scores={hp=..0},distance=2..10] at @s run scoreboard players remove @e[name=vessel,tag=core,sort=nearest,limit=1,distance=..2] hp 200
	
	execute as @e[name=vesselM,scores={hp=..0},tag=!no_hp] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] as @e[name=vesselM,tag=!exploding,distance=2..10] facing ~ ~ ~ run tp @s ^ ^ ^-10
	execute as @e[name=vesselM,scores={hp=..0},tag=!no_hp] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] as @e[name=vessel,distance=2..10] facing ~ ~ ~ run tp @s ^ ^ ^-10
	
		# 护甲V：清除周围 8 格所有子弹
		execute as @e[name=vesselM,scores={hp=..0,armor=5},tag=!no_hp] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] run kill @e[tag=bullet,distance=..8]
	
	tag @e[name=vesselM,scores={hp=..0}] add no_hp
	tag @e[name=vesselM,scores={hp=..0}] remove exploding
	
	tag @e[name=vesselM,scores={hp=1..}] remove no_hp
	
	
	