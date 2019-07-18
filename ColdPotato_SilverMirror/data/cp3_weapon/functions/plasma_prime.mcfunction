# 模块：武器
# 电浆炮 Prime
# 直线发射，碰撞（方块/舰艇）后爆炸并伴随少量颗粒效果
# 击中伤害：300，溅射 100
# 预装填

# 射击：F 键
# 根据射击者朝向向前发射一个移动的实体，带颗粒效果，aec 持续时间 10 s
execute at @s if entity @e[tag=module,tag=weapon,sort=nearest,limit=1,scores={cd_plasma_p=240}] run tag @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:gold_nugget"}]}] add shoot_plasma
	# cd
	execute at @s[tag=shoot_plasma] run scoreboard players set @e[tag=module,tag=weapon,sort=nearest,limit=1] cd_plasma_p 0

execute at @s[tag=shoot_plasma] run summon area_effect_cloud ^ ^ ^0.3 {Duration:200,CustomName:"\"plasma_prime\"",Tags:["summoning"]}
execute as @e[name=plasma_prime,tag=summoning] at @s rotated as @a[tag=inGame,tag=mod_weapon,tag=plasma_prime,sort=nearest,limit=1] run tp @s ~ ~ ~ ~ ~
execute as @e[name=plasma_prime,tag=summoning] at @s run scoreboard players operation @s number = @p[tag=inGame,tag=mod_weapon,tag=plasma_prime] number
tag @e[name=plasma_prime,tag=summoning] remove summoning

# bullet tag
tag @e[name=plasma_prime] add bullet
tag @e[name=plasma_prime,distance=..3] remove bullet

# reset
execute as @s[tag=shoot_plasma] run clear @s minecraft:gold_nugget
execute as @s[tag=shoot_plasma] run replaceitem entity @s hotbar.0 minecraft:gold_nugget
tag @s[tag=shoot_plasma] remove shoot_plasma

# tp Mk
execute as @e[name=plasma_prime] at @s run tp @s ^ ^ ^0.8

# particles
execute at @e[name=plasma_prime,distance=3..] run particle minecraft:dust 0.8 0.3 0.3 2 ~ ~ ~ 0 0 0 0 0 force
execute at @e[name=plasma_prime,distance=5..] run particle minecraft:flame ~ ~ ~ 0 0 0 0 0 force
execute at @e[name=plasma_prime,distance=10..] run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 0 force

# 判定撞到的是否是非己方舰艇
tag @e[name=plasma_prime] remove hit_vessel
execute as @e[name=plasma_prime,distance=3..] at @s unless score @s number = @e[tag=module,distance=..1.5,limit=1] number run tag @s add hit_vessel

# 撞到方块/舰艇后“爆炸”，给范围内模块损伤，给范围内玩家损伤，颗粒效果
execute as @e[name=plasma_prime] at @s unless block ~ ~ ~ air run summon minecraft:firework_rocket ~ ~ ~ {"Silent":1b,"FireworksItem":{"id":"minecraft:firework_rocket","Count":1b,"tag":{"Fireworks":{"Explosions":[{"Colors":[I;6227754],"Type":0b,"Trail":0b},]}}}}
#execute as @e[name=plasma_prime,tag=hit_vessel] at @s if entity @e[name=vessel,distance=..1.5] run summon minecraft:firework_rocket ~ ~ ~ {"Silent":1b,"FireworksItem":{"id":"minecraft:firework_rocket","Count":1b,"tag":{"Fireworks":{"Explosions":[{"Colors":[I;6227754],"Type":0b,"Trail":0b},]}}}}

# 击中伤害：300
execute as @e[name=plasma_prime] at @s unless block ~ ~ ~ air if entity @e[name=vesselM,scores={hp=1..},distance=..1.5] run scoreboard players remove @e[name=vesselM,scores={hp=1..},distance=..1.5] hp 300
execute as @e[name=plasma_prime] at @s unless block ~ ~ ~ air unless entity @e[name=vesselM,scores={hp=1..},distance=..1.5] run scoreboard players remove @e[tag=module,distance=..1.5,sort=nearest,limit=1] hp 300

execute as @e[name=plasma_prime,tag=hit_vessel] at @s if entity @e[name=vesselM,scores={hp=1..},distance=..1.5,sort=nearest,limit=1] run scoreboard players remove @e[name=vesselM,scores={hp=1..},distance=..1.5] hp 300
execute as @e[name=plasma_prime,tag=hit_vessel] at @s unless entity @e[name=vesselM,scores={hp=1..},distance=..1.5,sort=nearest,limit=1] run scoreboard players remove @e[tag=module,distance=..1.5,sort=nearest,limit=1] hp 300

execute as @e[name=plasma_prime] at @s unless block ~ ~ ~ air run kill @s
kill @e[name=plasma_prime,tag=hit_vessel]