# 模块：舰艇移动
# 功能：短程折跃
# module tag: 

# trigger：暂定为 Shift
execute if entity @a[scores={Shift=60..}] as @e[name=Ship] at @s run tp @s ^ ^ ^20

scoreboard players reset @a[scores={Shift=60..}]
