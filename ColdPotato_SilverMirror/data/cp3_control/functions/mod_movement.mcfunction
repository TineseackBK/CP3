# 控制：移动模块
# module tag: mod_movement

# 进入模块：玩家右键矿车
tag @a[tag=mod_movement] remove mod_movement
tag @a[nbt={RootVehicle:{Entity:{id:"minecraft:minecart",CustomName:'{"text":"vehicle"}',Tags:["mod_movement"]}}}] add mod_movement
replaceitem entity @a[tag=inVessel,tag=mod_movement] hotbar.7 minecraft:music_disc_13{weapon_item:1b}
replaceitem entity @a[tag=inVessel,tag=mod_movement] hotbar.8 minecraft:music_disc_11{weapon_item:1b}
tag @a[tag=inVessel,tag=mod_movement] add select_movement
tag @a[tag=mod_movement] remove inVessel
execute as @a[tag=mod_movement] at @s run scoreboard players add @e[name=vehicle,tag=mod_movement,sort=nearest,limit=1] number 0
execute as @a[tag=mod_movement] at @s run scoreboard players operation @e[name=vehicle,tag=mod_movement,sort=nearest,limit=1] number = @s number

# 离开模块：玩家 Shift 离开矿车
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=1}] run kill @e[name=vehicle,tag=mod_movement,scores={number=1}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=1}] run tp @s @e[name=mod_movement,scores={number=1},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=2}] run kill @e[name=vehicle,tag=mod_movement,scores={number=2}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=2}] run tp @s @e[name=mod_movement,scores={number=2},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=3}] run kill @e[name=vehicle,tag=mod_movement,scores={number=3}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=3}] run tp @s @e[name=mod_movement,scores={number=3},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=4}] run kill @e[name=vehicle,tag=mod_movement,scores={number=4}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=4}] run tp @s @e[name=mod_movement,scores={number=4},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=5}] run kill @e[name=vehicle,tag=mod_movement,scores={number=5}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=5}] run tp @s @e[name=mod_movement,scores={number=5},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-1}] run kill @e[name=vehicle,tag=mod_movement,scores={number=-1}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-1}] run tp @s @e[name=mod_movement,scores={number=-1},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-2}] run kill @e[name=vehicle,tag=mod_movement,scores={number=-2}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-2}] run tp @s @e[name=mod_movement,scores={number=-2},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-3}] run kill @e[name=vehicle,tag=mod_movement,scores={number=-3}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-3}] run tp @s @e[name=mod_movement,scores={number=-3},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-4}] run kill @e[name=vehicle,tag=mod_movement,scores={number=-4}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-4}] run tp @s @e[name=mod_movement,scores={number=-4},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-5}] run kill @e[name=vehicle,tag=mod_movement,scores={number=-5}]
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel,scores={number=-5}] run tp @s @e[name=mod_movement,scores={number=-5},limit=1]

execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel] run clear @s music_disc_13
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel] run clear @s music_disc_11
execute as @a[tag=select_movement,tag=!mod_movement,tag=!inVessel] run tag @s add inVessel
execute as @a[tag=select_movement,tag=inVessel] run tag @s remove select_movement

# 在模块中：效果（漂浮255，隐身，生命恢复，抗性提升5）
effect give @a[tag=mod_movement] levitation 1 255 true
effect give @a[tag=mod_movement] invisibility 1 255 true
effect give @a[tag=mod_movement] resistance 1 5 true
effect give @a[tag=mod_movement] regeneration 1 255 true
effect give @a[tag=mod_movement] saturation 1 255 true

# 在模块中：HUD

# 在模块中：侧边栏显示
# ===========
# [舰艇名称]
# [舰艇舷号]
# [总耐久]
# [档位]
# [速率]
# []
# ===========


