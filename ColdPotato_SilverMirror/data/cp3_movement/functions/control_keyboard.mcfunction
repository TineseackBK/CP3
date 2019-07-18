# 模块：舰艇移动
# 操控 - 纯键盘操控
# module tag: mod_movement
# obj: RotationX(Y), RotationX(Y)T

# 1 - 舰首向左
execute as @a[nbt={SelectedItemSlot:0},tag=inGame,tag=mod_movement] run tag @s add left
execute as @a[tag=left] at @s as @e[name=vessel,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~-0.8 ~

# 2 - 舰首向右
execute as @a[nbt={SelectedItemSlot:1},tag=inGame,tag=mod_movement] run tag @s add right
execute as @a[tag=right] at @s as @e[name=vessel,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~0.8 ~

# 3 - 舰首向上
execute as @a[nbt={SelectedItemSlot:2},tag=inGame,tag=mod_movement] run tag @s add up
execute as @a[tag=up] at @s as @e[name=vessel,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ ~-0.7

# 4 - 舰首向下
execute as @a[nbt={SelectedItemSlot:3},tag=inGame,tag=mod_movement] run tag @s add down
execute as @a[tag=down] at @s as @e[name=vessel,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ ~0.7

# 5 - 刹车
execute as @a[nbt={SelectedItemSlot:4},tag=inGame,tag=mod_movement] run tag @s add brake
execute as @a[tag=brake] run scoreboard players set @s accel 0
execute as @a[tag=!brake] run scoreboard players remove @s brakeTimer 2
execute as @a[tag=!brake,scores={brakeTimer=..0}] run scoreboard players set @s brakeTimer 0
execute as @a[tag=brake] run scoreboard players add @s brakeTimer 1
execute as @a[scores={brakeTimer=20..}] run function cp3_movement:brake
execute as @a[scores={brakeTimer=20..}] run scoreboard players set @s brakeTimer 0

# 7/F - 提升1档
execute as @a[nbt={SelectedItemSlot:7,Inventory:[{Slot:-106b,id:"minecraft:music_disc_13"}]},tag=inGame,tag=mod_movement] run tag @s add speed_up
execute as @a[tag=speed_up] run scoreboard players add @s accel 1
execute as @a[tag=speed_up] run clear @s minecraft:music_disc_13
execute as @a[tag=speed_up] run replaceitem entity @s hotbar.7 minecraft:music_disc_13

# 8/F - 降低1档
execute as @a[nbt={SelectedItemSlot:8,Inventory:[{Slot:-106b,id:"minecraft:music_disc_11"}]},tag=inGame,tag=mod_movement] run tag @s add speed_down
execute as @a[tag=speed_down] run scoreboard players remove @s accel 1
execute as @a[tag=speed_down] run clear @s minecraft:music_disc_11
execute as @a[tag=speed_down] run replaceitem entity @s hotbar.8 minecraft:music_disc_11

# reset
tag @a remove up
tag @a remove down
tag @a remove left
tag @a remove right
tag @a remove speed_up
tag @a remove speed_down
