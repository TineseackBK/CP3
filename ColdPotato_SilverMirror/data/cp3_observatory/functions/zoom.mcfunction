# 模块：瞭望
# 切换缩放等级

# 5 - zoom in
tag @a[nbt={SelectedItemSlot:5,Inventory:[{Slot:-106b,id:"minecraft:music_disc_far"}]}] add zoom_in

	# 若进入缩放 2，则给予一瞬间失明作为闪烁效果
	execute as @a[tag=zoom_in] at @s if entity @e[name=vehicle,tag=mod_observatory,scores={zoom=1},sort=nearest,limit=1] run effect give @s minecraft:blindness 1 0 true

	# 缩放分数 +1（最高 2）
	execute as @a[tag=zoom_in] at @s run scoreboard players add @e[name=vehicle,tag=mod_observatory,scores={zoom=..1},sort=nearest,limit=1] zoom 1
	
	# reset
	execute as @a[tag=zoom_in] run clear @s minecraft:music_disc_far
	execute as @a[tag=zoom_in] run replaceitem entity @s hotbar.5 minecraft:music_disc_far
	tag @a[tag=zoom_in] remove zoom_in

# 6 - zoom out
tag @a[nbt={SelectedItemSlot:6,Inventory:[{Slot:-106b,id:"minecraft:music_disc_mall"}]}] add zoom_out
	
	# 缩放分数 -1（最低 0）
	execute as @a[tag=zoom_out] at @s run scoreboard players remove @e[name=vehicle,tag=mod_observatory,scores={zoom=1..},sort=nearest,limit=1] zoom 1
	
	# reset
	execute as @a[tag=zoom_out] run clear @s minecraft:music_disc_mall
	execute as @a[tag=zoom_out] run replaceitem entity @s hotbar.6 minecraft:music_disc_mall
	tag @a[tag=zoom_out] remove zoom_out

	
# 缩放 1：缓慢 3
execute at @e[name=vehicle,tag=mod_observatory,scores={zoom=1}] run effect give @p[tag=mod_observatory] minecraft:slowness 1 2 true

# 缩放 2：缓慢 6
execute at @e[name=vehicle,tag=mod_observatory,scores={zoom=2}] run effect give @p[tag=mod_observatory] minecraft:slowness 1 5 true