# 模块：武器
# 护甲
# 耐久：
# 舰艇护甲I：1000
# 舰艇护甲II：2000
# 舰艇护甲III：3000
# 舰艇护甲IV：4000
# 舰艇护甲V：5000
# obj：shield_timer

# 10 秒显示一次
scoreboard players add @e[name=vesselM,scores={hp=1..}] shield_timer 1
execute as @e[name=vesselM,scores={hp=1..,shield_timer=200}] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] rotated as @e[name=vessel,tag=core,sort=nearest,limit=1] facing ^ ^ ^1 run function cp3_weapon:particle_7
execute as @e[name=vesselM,scores={hp=1..,shield_timer=200}] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] rotated as @e[name=vessel,tag=core,sort=nearest,limit=1] facing ^ ^ ^-1 run function cp3_weapon:particle_7
scoreboard players set @e[name=vesselM,scores={hp=1..,shield_timer=200..}] shield_timer 0

# 被击中时（无论是否扣耐久）显示伤害来源
execute as @e[name=vesselM,scores={hp=1..},tag=!be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] if entity @e[tag=bullet,distance=..3] run summon area_effect_cloud ~ ~ ~ {Duration:8,Tags:["hit_duration"]}
execute as @e[name=vesselM,scores={hp=1..},tag=!be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] if entity @e[tag=bullet,distance=..3] run tp @e[tag=hit_duration,distance=..1] ~ ~ ~ facing entity @e[tag=bullet,distance=..3,limit=1] eyes 
execute as @e[name=vesselM,scores={hp=1..},tag=!be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] if entity @e[tag=bullet,distance=..3] run tag @s add be_hit

execute as @e[name=vesselM,scores={hp=1..},tag=be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] at @e[tag=hit_duration,distance=..1,nbt={Age:1}] run function cp3_weapon:particle_1
execute as @e[name=vesselM,scores={hp=1..},tag=be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] at @e[tag=hit_duration,distance=..1,nbt={Age:2}] run function cp3_weapon:particle_2
execute as @e[name=vesselM,scores={hp=1..},tag=be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] at @e[tag=hit_duration,distance=..1,nbt={Age:3}] run function cp3_weapon:particle_3
execute as @e[name=vesselM,scores={hp=1..},tag=be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] at @e[tag=hit_duration,distance=..1,nbt={Age:4}] run function cp3_weapon:particle_4
execute as @e[name=vesselM,scores={hp=1..},tag=be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] at @e[tag=hit_duration,distance=..1,nbt={Age:5}] run function cp3_weapon:particle_5
execute as @e[name=vesselM,scores={hp=1..},tag=be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] at @e[tag=hit_duration,distance=..1,nbt={Age:6}] run function cp3_weapon:particle_6

execute as @e[name=vesselM,scores={hp=1..},tag=be_hit] at @s at @e[name=vessel,tag=core,sort=nearest,limit=1] if entity @e[tag=hit_duration,distance=..1,nbt={Age:7}] run tag @s remove be_hit