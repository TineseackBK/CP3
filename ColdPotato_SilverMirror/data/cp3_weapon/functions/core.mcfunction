# 模块：武器
# 核心函数
# obj: cd_plasma, cd_plasma_p, cd_laser, cd_laser_p, cd_nuclear
# 电浆炮/3 电浆炮P/12 激光/3 激光P/10 核弹/15
# 电磁炮/60+模块 撞针/50 制导鱼雷/90+模块 制导鱼雷P/80+模块
# 诱导弹/30 能量护盾/30+模块

# cd 增加
execute at @a[tag=mod_weapon,tag=!plasma_prime] run scoreboard players add @e[tag=module,tag=weapon,scores={cd_plasma=0..59},sort=nearest,limit=1] cd_plasma 1
execute at @a[tag=mod_weapon,tag=plasma_prime] run scoreboard players add @e[tag=module,tag=weapon,scores={cd_plasma_p=0..239},sort=nearest,limit=1] cd_plasma_p 1
execute at @a[tag=mod_weapon,tag=!laser_prime] run scoreboard players add @e[tag=module,tag=weapon,scores={cd_laser=0..59},sort=nearest,limit=1] cd_laser 1
execute at @a[tag=mod_weapon,tag=laser_prime] run scoreboard players add @e[tag=module,tag=weapon,scores={cd_laser_p=0..199},sort=nearest,limit=1] cd_laser_p 1
scoreboard players add @e[tag=module,tag=weapon,scores={cd_nuclear=0..299}] cd_nuclear 1

# 在 cd 中
	# plasma
	execute as @e[tag=module,tag=weapon,scores={cd_plasma=0..59}] at @s run clear @p[tag=inGame,tag=mod_weapon,tag=!plasma_prime] minecraft:gold_nugget
	execute as @e[tag=module,tag=weapon,scores={cd_plasma=0..59}] at @s run replaceitem entity @p[tag=inGame,tag=mod_weapon,tag=!plasma_prime] hotbar.0 minecraft:gold_nugget{weapon_item:1b,prime:0b}
		# plasma prime
		execute as @e[tag=module,tag=weapon,scores={cd_plasma_p=0..239}] at @s run clear @p[tag=inGame,tag=mod_weapon,tag=plasma_prime] minecraft:gold_nugget
		execute as @e[tag=module,tag=weapon,scores={cd_plasma_p=0..239}] at @s run replaceitem entity @p[tag=inGame,tag=mod_weapon,tag=plasma_prime] hotbar.0 minecraft:gold_nugget{weapon_item:1b,prime:1b}
	
	# laser
	execute as @e[tag=module,tag=weapon,scores={cd_laser=0..59}] at @s run clear @p[tag=inGame,tag=mod_weapon,tag=!laser_prime] minecraft:bone
	execute as @e[tag=module,tag=weapon,scores={cd_laser=0..59}] at @s run replaceitem entity @p[tag=inGame,tag=mod_weapon,tag=!laser_prime] hotbar.1 minecraft:bone{weapon_item:1b,prime:0b}
		# laser prime
		execute as @e[tag=module,tag=weapon,scores={cd_laser_p=0..199}] at @s run clear @p[tag=inGame,tag=mod_weapon,tag=laser_prime] minecraft:bone
		execute as @e[tag=module,tag=weapon,scores={cd_laser_p=0..199}] at @s run replaceitem entity @p[tag=inGame,tag=mod_weapon,tag=laser_prime] hotbar.1 minecraft:bone{weapon_item:1b,prime:1b}

# 执行函数
execute as @a[tag=inGame,tag=mod_weapon,tag=!plasma_prime] run function cp3_weapon:plasma
execute as @a[tag=inGame,tag=mod_weapon,tag=!laser_prime] run function cp3_weapon:laser
	# Prime
	execute as @a[tag=inGame,tag=mod_weapon,tag=plasma_prime] at @s run function cp3_weapon:plasma_prime
	execute as @a[tag=inGame,tag=mod_weapon,tag=laser_prime] at @s run function cp3_weapon:laser_prime

function cp3_weapon:shield

# Prime 转换
# 选中相应武器按 Q 转换 Prime 模式
	# plasma
	execute as @e[tag=module,tag=weapon,tag=!plasma_prime] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gold_nugget",tag:{weapon_item:1b,prime:0b}}},distance=..2,limit=1] run tellraw @s ["",{"text":"  电浆炮 ","color":"red","bold":true},{"text":"已切换到"},{"text":" Prime ","color":"gold"},{"text":"模式"}]
	execute as @a[tag=mod_weapon,nbt={SelectedItemSlot:0},tag=!plasma_prime] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gold_nugget",tag:{weapon_item:1b,prime:0b}}},distance=..2,limit=1] run tag @s add plasma_prime
		# reset
		execute as @a[tag=mod_weapon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gold_nugget",tag:{weapon_item:1b,prime:0b}}},distance=..2,limit=1] run replaceitem entity @s hotbar.0 minecraft:gold_nugget{weapon_item:1b,prime:1b}
		kill @e[type=item,nbt={Item:{tag:{weapon_item:1b,prime:0b}}}]
	
	execute as @a[tag=mod_weapon,nbt={SelectedItemSlot:0},tag=plasma_prime] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gold_nugget",tag:{weapon_item:1b,prime:1b}}},distance=..2,limit=1] run tellraw @s ["",{"text":"  电浆炮 ","color":"red","bold":true},{"text":"已切换到"},{"text":" Normal ","color":"gray"},{"text":"模式"}]
	execute as @a[tag=mod_weapon,nbt={SelectedItemSlot:0},tag=plasma_prime] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gold_nugget",tag:{weapon_item:1b,prime:1b}}},distance=..2,limit=1] run tag @s remove plasma_prime
		# reset
		execute as @a[tag=mod_weapon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gold_nugget",tag:{weapon_item:0b,prime:1b}}},distance=..2,limit=1] run replaceitem entity @s hotbar.0 minecraft:gold_nugget{weapon_item:1b,prime:0b}
		kill @e[type=item,nbt={Item:{tag:{weapon_item:1b,prime:0b}}}]
	
	# laser
	
