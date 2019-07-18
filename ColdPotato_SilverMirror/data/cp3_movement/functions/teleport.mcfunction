# 模块：舰艇移动
# tp
# module tag: mod_movement

# 舰艇组装
	# 舰艇核心
	execute as @e[name=vesselM] at @s run tp @e[name=vessel,limit=1,sort=nearest] ~ ~ ~
	
	# 【临时】武器位
	execute as @e[name=vessel] at @s run tp @e[tag=module,tag=weapon,limit=1,sort=nearest] ^1 ^-0.5 ^

# 移动位
execute as @e[name=vessel,scores={number=1}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=1},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=2}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=2},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=3}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=3},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=4}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=4},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=5}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=5},limit=1] ~ ~ ~

execute as @e[name=vessel,scores={number=-1}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=-1},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=-2}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=-2},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=-3}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=-3},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=-4}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=-4},limit=1] ~ ~ ~
execute as @e[name=vessel,scores={number=-5}] at @s run tp @e[name=vehicle,tag=mod_movement,scores={number=-5},limit=1] ~ ~ ~

# 武器位
execute as @e[tag=module,tag=weapon,scores={number=1}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=1},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=2}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=2},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=3}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=3},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=4}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=4},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=5}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=5},limit=1] ~ ~1.2 ~0.2

execute as @e[tag=module,tag=weapon,scores={number=-1}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=-1},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=-2}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=-2},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=-3}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=-3},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=-4}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=-4},limit=1] ~ ~1.2 ~0.2
execute as @e[tag=module,tag=weapon,scores={number=-5}] at @s run tp @e[name=vehicle,tag=mod_weapon,scores={number=-5},limit=1] ~ ~1.2 ~0.2

# 瞭望位 - 缩放 0
execute as @e[tag=module,tag=observatory,scores={number=1}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=1,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=2}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=2,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=3}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=3,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=4}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=4,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=5}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=5,zoom=0},limit=1] ^ ^0.7 ^

execute as @e[tag=module,tag=observatory,scores={number=-1}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=-1,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=-2}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=-2,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=-3}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=-3,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=-4}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=-4,zoom=0},limit=1] ^ ^0.7 ^
execute as @e[tag=module,tag=observatory,scores={number=-5}] at @s run tp @e[name=vehicle,tag=mod_observatory,scores={number=-5,zoom=0},limit=1] ^ ^0.7 ^

# 瞭望位 - 缩放 1
execute as @e[tag=module,tag=observatory,scores={number=1}] at @s rotated as @a[scores={number=1},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=1,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=2}] at @s rotated as @a[scores={number=2},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=2,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=3}] at @s rotated as @a[scores={number=3},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=3,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=4}] at @s rotated as @a[scores={number=4},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=4,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=5}] at @s rotated as @a[scores={number=5},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=5,zoom=1},limit=1] ^ ^0.7 ^10

execute as @e[tag=module,tag=observatory,scores={number=-1}] at @s rotated as @a[scores={number=-1},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-1,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=-2}] at @s rotated as @a[scores={number=-2},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-2,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=-3}] at @s rotated as @a[scores={number=-3},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-3,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=-4}] at @s rotated as @a[scores={number=-4},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-4,zoom=1},limit=1] ^ ^0.7 ^10
execute as @e[tag=module,tag=observatory,scores={number=-5}] at @s rotated as @a[scores={number=-5},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-5,zoom=1},limit=1] ^ ^0.7 ^10

# 瞭望位 - 缩放 2
execute as @e[tag=module,tag=observatory,scores={number=1}] at @s rotated as @a[scores={number=1},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=1,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=2}] at @s rotated as @a[scores={number=2},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=2,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=3}] at @s rotated as @a[scores={number=3},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=3,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=4}] at @s rotated as @a[scores={number=4},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=4,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=5}] at @s rotated as @a[scores={number=5},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=5,zoom=2},limit=1] ^ ^0.7 ^20

execute as @e[tag=module,tag=observatory,scores={number=-1}] at @s rotated as @a[scores={number=-1},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-1,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=-2}] at @s rotated as @a[scores={number=-2},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-2,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=-3}] at @s rotated as @a[scores={number=-3},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-3,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=-4}] at @s rotated as @a[scores={number=-4},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-4,zoom=2},limit=1] ^ ^0.7 ^20
execute as @e[tag=module,tag=observatory,scores={number=-5}] at @s rotated as @a[scores={number=-5},tag=mod_observatory] run tp @e[name=vehicle,tag=mod_observatory,scores={number=-5,zoom=2},limit=1] ^ ^0.7 ^20
