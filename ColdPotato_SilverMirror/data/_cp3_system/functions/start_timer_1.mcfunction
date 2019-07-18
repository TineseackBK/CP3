# 系统：选择阵营后的计时器
# timer1
# obj: start_timer
# tag: started, started_over

tag @e[name=system,limit=1] add started

# 计时 3 秒
execute as @e[name=system,tag=started,scores={start_timer=60..},limit=1] run title @a[team=!] subtitle ["",{"text":"请勿离开准备场地","color":"red"}]
execute as @e[name=system,tag=started,scores={start_timer=60..},limit=1] run title @a[team=!] title ["",{"text":"身份识别中...","color":"gold"}]

scoreboard players remove @e[name=system,tag=started,scores={start_timer=1..},limit=1] start_timer 1

execute as @e[name=system,tag=started,scores={start_timer=40},limit=1] run title @a[team=!] times 0 40 0
execute as @e[name=system,tag=started,scores={start_timer=40},limit=1] run title @a[team=!] subtitle ["",{"text":"请勿离开准备场地","color":"red"}]
execute as @e[name=system,tag=started,scores={start_timer=40},limit=1] run title @a[team=!] title ["",{"text":"正在加载舰艇选择","color":"gold"}]

# 进入舰艇选择区域
execute as @e[name=system,tag=started,scores={start_timer=0},limit=1] run tp @a[team=Potatoy] @e[name=tpMk,tag=pot,limit=1]
execute as @e[name=system,tag=started,scores={start_timer=0},limit=1] run tp @a[team=Earth] @e[name=tpMk,tag=ear,limit=1]
execute as @e[name=system,tag=started,scores={start_timer=0},limit=1] run say succeeded!

# reset
tag @e[name=system,tag=started,scores={start_timer=0},limit=1] add started_over
tag @e[name=system,tag=started,scores={start_timer=0},limit=1] remove started
scoreboard players set @e[name=system,scores={start_timer=0},limit=1] start_timer 60
