# 模块：舰艇移动
# 刹车
# module tag: mod_movement
# obj: MotionX(Y/Z)
# entities: vesselM

# 刹车 (*0.8)
execute as @e[name=vesselM,sort=nearest,limit=1] run scoreboard players operation @s MotionX *= 8 Const
execute as @e[name=vesselM,sort=nearest,limit=1] run scoreboard players operation @s MotionY *= 8 Const
execute as @e[name=vesselM,sort=nearest,limit=1] run scoreboard players operation @s MotionZ *= 8 Const
execute as @e[name=vesselM,sort=nearest,limit=1] run scoreboard players operation @s MotionX /= 10 Const
execute as @e[name=vesselM,sort=nearest,limit=1] run scoreboard players operation @s MotionY /= 10 Const
execute as @e[name=vesselM,sort=nearest,limit=1] run scoreboard players operation @s MotionZ /= 10 Const

execute as @e[name=vesselM,sort=nearest,limit=1,scores={MotionX=-50000..50000}] run scoreboard players set @s MotionX 0
execute as @e[name=vesselM,sort=nearest,limit=1,scores={MotionY=-50000..50000}] run scoreboard players set @s MotionY 0
execute as @e[name=vesselM,sort=nearest,limit=1,scores={MotionZ=-50000..50000}] run scoreboard players set @s MotionZ 0

tag @s remove brake