# 系统：游戏初始化

tag @e[name=system] add control_mouse
tag @a add inGame
tag @a add inVessel

# 初始化舰艇实体
	# 实体生成
	execute if entity @a[scores={number=1}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,CustomName:'"vessel"',ArmorItems:[{},{},{},{id:"packed_ice",Count:1b}],Tags:["vessel","module","core","1"]}
	execute if entity @a[scores={number=1}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:silverfish ~ ~ ~ {PersistenceRequied:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,CustomName:'"vesselM"',Tags:["vessel","module","1"]}
	execute if entity @a[scores={number=1}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,Pose:{Head:[50f,0f,0f]},ArmorItems:[{},{},{},{id:"smooth_stone",Count:1b}],Tags:["vessel","module","weapon","1"]}

	execute if entity @a[scores={number=2}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:armor_stand ~2 ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,CustomName:'"vessel"',ArmorItems:[{},{},{},{id:"packed_ice",Count:1b}],Tags:["vessel","module","core","2"]}
	execute if entity @a[scores={number=2}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:silverfish ~2 ~ ~ {PersistenceRequied:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,CustomName:'"vesselM"',Tags:["vessel","module","2"]}
	execute if entity @a[scores={number=2}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,Pose:{Head:[50f,0f,0f]},ArmorItems:[{},{},{},{id:"smooth_stone",Count:1b}],Tags:["vessel","module","weapon","2"]}
	
	execute if entity @a[scores={number=-1}] at @e[name=spawnpoint,tag=Earth,limit=1] run summon minecraft:armor_stand ~2 ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,CustomName:'"vessel"',ArmorItems:[{},{},{},{id:"packed_ice",Count:1b}],Tags:["vessel","module","core","-1"]}
	execute if entity @a[scores={number=-1}] at @e[name=spawnpoint,tag=Earth,limit=1] run summon minecraft:silverfish ~2 ~ ~ {PersistenceRequied:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,CustomName:'"vesselM"',Tags:["vessel","module","-1"]}
	execute if entity @a[scores={number=-1}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,Pose:{Head:[50f,0f,0f]},ArmorItems:[{},{},{},{id:"smooth_stone",Count:1b}],Tags:["vessel","module","weapon","-1"]}
	
	execute if entity @a[scores={number=-2}] at @e[name=spawnpoint,tag=Earth,limit=1] run summon minecraft:armor_stand ~2 ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,CustomName:'"vessel"',ArmorItems:[{},{},{},{id:"packed_ice",Count:1b}],Tags:["vessel","module","core","-2"]}
	execute if entity @a[scores={number=-2}] at @e[name=spawnpoint,tag=Earth,limit=1] run summon minecraft:silverfish ~2 ~ ~ {PersistenceRequied:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,CustomName:'"vesselM"',Tags:["vessel","module","-2"]}
	execute if entity @a[scores={number=-2}] at @e[name=spawnpoint,tag=Potatoy,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,Pose:{Head:[50f,0f,0f]},ArmorItems:[{},{},{},{id:"smooth_stone",Count:1b}],Tags:["vessel","module","weapon","-2"]}
	
	# number
	scoreboard players set @e[tag=vessel,tag=1] number 1
	scoreboard players set @e[tag=vessel,tag=2] number 2
	scoreboard players set @e[tag=vessel,tag=3] number 3
	scoreboard players set @e[tag=vessel,tag=4] number 4
	scoreboard players set @e[tag=vessel,tag=5] number 5
	
	scoreboard players set @e[tag=vessel,tag=-1] number -1
	scoreboard players set @e[tag=vessel,tag=-2] number -2
	scoreboard players set @e[tag=vessel,tag=-3] number -3
	scoreboard players set @e[tag=vessel,tag=-4] number -4
	scoreboard players set @e[tag=vessel,tag=-5] number -5
	
	# reset
	tag @e[tag=vessel] remove 1
	tag @e[tag=vessel] remove 2
	tag @e[tag=vessel] remove 3
	tag @e[tag=vessel] remove 4
	tag @e[tag=vessel] remove 5
	
	tag @e[tag=vessel] remove -1
	tag @e[tag=vessel] remove -2
	tag @e[tag=vessel] remove -3
	tag @e[tag=vessel] remove -4
	tag @e[tag=vessel] remove -5
	
	# hp
	function cp3_data:hp_init
	
	# cd
	function cp3_weapon:cd_init
	
# 移动玩家至舰艇建筑
tp @a[scores={number=1}] @e[name=mod_movement,scores={number=1},limit=1]
tp @a[scores={number=2}] @e[name=mod_movement,scores={number=2},limit=1]

tp @a[scores={number=-1}] @e[name=mod_movement,scores={number=-1},limit=1]
tp @a[scores={number=-2}] @e[name=mod_movement,scores={number=-2},limit=1]