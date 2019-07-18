# 控制：移动模块
# module tag: mod_observatory

# 进入模块：玩家右键矿车
tag @a[tag=mod_observatory] remove mod_observatory
tag @a[nbt={RootVehicle:{Entity:{id:"minecraft:minecart",CustomName:'{"text":"vehicle"}',Tags:["mod_observatory"]}}}] add mod_observatory
replaceitem entity @a[tag=inVessel,tag=mod_observatory] hotbar.5 minecraft:music_disc_far{weapon_item:1b}
replaceitem entity @a[tag=inVessel,tag=mod_observatory] hotbar.6 minecraft:music_disc_mall{weapon_item:1b}
execute at @a[tag=inVessel,tag=mod_observatory] run scoreboard players add @e[name=vehicle,tag=mod_observatory,sort=nearest,limit=1] zoom 0
tag @a[tag=inVessel,tag=mod_observatory] add select_observatory
tag @a[tag=mod_observatory] remove inVessel
execute as @a[tag=mod_observatory] at @s run scoreboard players add @e[name=vehicle,tag=mod_observatory,sort=nearest,limit=1] number 0
execute as @a[tag=mod_observatory] at @s run scoreboard players operation @e[name=vehicle,tag=mod_observatory,sort=nearest,limit=1] number = @s number

# 离开模块：玩家 Shift 离开矿车
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=1}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=1}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=1}] run tp @s @e[name=mod_observatory,scores={number=1},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=2}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=2}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=2}] run tp @s @e[name=mod_observatory,scores={number=2},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=3}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=3}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=3}] run tp @s @e[name=mod_observatory,scores={number=3},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=4}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=4}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=4}] run tp @s @e[name=mod_observatory,scores={number=4},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=5}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=5}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=5}] run tp @s @e[name=mod_observatory,scores={number=5},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-1}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=-1}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-1}] run tp @s @e[name=mod_observatory,scores={number=-1},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-2}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=-2}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-2}] run tp @s @e[name=mod_observatory,scores={number=-2},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-3}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=-3}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-3}] run tp @s @e[name=mod_observatory,scores={number=-3},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-4}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=-4}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-4}] run tp @s @e[name=mod_observatory,scores={number=-4},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-5}] run kill @e[name=vehicle,tag=mod_observatory,scores={number=-5}]
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel,scores={number=-5}] run tp @s @e[name=mod_observatory,scores={number=-5},limit=1]

execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel] run clear @s music_disc_far
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel] run clear @s music_disc_mall
execute as @a[tag=select_observatory,tag=!mod_observatory,tag=!inVessel] run tag @s add inVessel
execute as @a[tag=select_observatory,tag=inVessel] run tag @s remove select_observatory

# 在模块中：效果（漂浮255，隐身，生命恢复，抗性提升5）
effect give @a[tag=mod_observatory] levitation 1 255 true
effect give @a[tag=mod_observatory] invisibility 1 255 true
effect give @a[tag=mod_observatory] resistance 1 5 true
effect give @a[tag=mod_observatory] regeneration 1 255 true
effect give @a[tag=mod_observatory] saturation 1 255 true

# 在模块中：HUD

