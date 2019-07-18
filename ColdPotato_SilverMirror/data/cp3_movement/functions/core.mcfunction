# 模块：移动
# 核心函数

execute if entity @e[name=system,tag=control_keyboard] run function cp3_movement:control_keyboard
execute if entity @e[name=system,tag=control_mouse] run function cp3_movement:control_mouse
function cp3_movement:accelerate
function cp3_movement:teleport