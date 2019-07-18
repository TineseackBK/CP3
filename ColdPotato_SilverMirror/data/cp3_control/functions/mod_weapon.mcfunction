# 控制：移动模块
# module tag: mod_weapon

# 进入模块：玩家右键矿车
tag @a[tag=mod_weapon] remove mod_weapon
tag @a[nbt={RootVehicle:{Entity:{id:"minecraft:minecart",CustomName:'{"text":"vehicle"}',Tags:["mod_weapon"]}}}] add mod_weapon
replaceitem entity @a[tag=inVessel,tag=mod_weapon] hotbar.0 minecraft:gold_nugget{weapon_item:1b,prime:0b}
replaceitem entity @a[tag=inVessel,tag=mod_weapon] hotbar.1 minecraft:bone{weapon_item:1b,prime:0b}
tag @a[tag=inVessel,tag=mod_weapon] add select_weapon
tag @a[tag=mod_weapon] remove inVessel
execute as @a[tag=mod_weapon] at @s run scoreboard players add @e[name=vehicle,tag=mod_weapon,sort=nearest,limit=1] number 0
execute as @a[tag=mod_weapon] at @s run scoreboard players operation @e[name=vehicle,tag=mod_weapon,sort=nearest,limit=1] number = @s number

# 离开模块：玩家 Shift 离开矿车
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=1}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=1}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=1}] run tp @s @e[name=mod_weapon,scores={number=1},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=2}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=2}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=2}] run tp @s @e[name=mod_weapon,scores={number=2},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=3}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=3}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=3}] run tp @s @e[name=mod_weapon,scores={number=3},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=4}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=4}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=4}] run tp @s @e[name=mod_weapon,scores={number=4},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=5}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=5}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=5}] run tp @s @e[name=mod_weapon,scores={number=5},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-1}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=-1}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-1}] run tp @s @e[name=mod_weapon,scores={number=-1},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-2}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=-2}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-2}] run tp @s @e[name=mod_weapon,scores={number=-2},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-3}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=-3}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-3}] run tp @s @e[name=mod_weapon,scores={number=-3},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-4}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=-4}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-4}] run tp @s @e[name=mod_weapon,scores={number=-4},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-5}] run kill @e[name=vehicle,tag=mod_weapon,scores={number=-5}]
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel,scores={number=-5}] run tp @s @e[name=mod_weapon,scores={number=-5},limit=1]

execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel] run clear @s gold_nugget
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel] run clear @s bone
execute as @a[tag=select_weapon,tag=!mod_weapon,tag=!inVessel] run tag @s add inVessel
execute as @a[tag=select_weapon,tag=inVessel] run tag @s remove select_weapon

# 在模块中：效果（漂浮255，隐身，生命恢复，抗性提升5）
effect give @a[tag=mod_weapon] levitation 1 255 true
effect give @a[tag=mod_weapon] invisibility 1 255 true
effect give @a[tag=mod_weapon] resistance 1 5 true
effect give @a[tag=mod_weapon] regeneration 1 255 true
effect give @a[tag=mod_weapon] saturation 1 255 true

# 在模块中：HUD
