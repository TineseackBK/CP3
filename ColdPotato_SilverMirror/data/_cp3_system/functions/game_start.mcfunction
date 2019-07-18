# 系统：开始游戏
# obj: stat_total, stat_pot, stat_ear, stat_spe, line
# team: Potatoy, Earth, Spectator
# tag: started, started_over

# 加入阵营
execute as @a at @s if block ~ ~-1 ~ orange_wool run team join Potatoy @s
execute as @a at @s if block ~ ~-1 ~ purple_wool run team join Potatoy @s
execute as @a at @s if block ~ ~-1 ~ cyan_wool run team join Earth @s
execute as @a at @s if block ~ ~-1 ~ smooth_quartz run team join Spectator @s
execute as @a at @s if block ~ ~-1 ~ chiseled_stone_bricks run team leave @s

# 记录总人数，并用总人数减去三个队伍人数，分数为 0 即开始
scoreboard players reset @e[name=system] stat_total
scoreboard players reset @e[name=system] stat_pot
scoreboard players reset @e[name=system] stat_ear
scoreboard players reset @e[name=system] stat_spe

execute as @a[team=!] run scoreboard players add @e[name=system,limit=1] stat_total 1
execute as @a[team=Potatoy] run scoreboard players add @e[name=system,limit=1] stat_pot 1
execute as @a[team=Earth] run scoreboard players add @e[name=system,limit=1] stat_ear 1
execute as @a[team=Spectator] run scoreboard players add @e[name=system,limit=1] stat_spe 1

scoreboard players operation @e[name=system,limit=1] stat_total -= @e[name=system,scores={stat_total=1..},limit=1] stat_pot
scoreboard players operation @e[name=system,limit=1] stat_total -= @e[name=system,scores={stat_total=1..},limit=1] stat_ear
scoreboard players operation @e[name=system,limit=1] stat_total -= @e[name=system,scores={stat_total=1..},limit=1] stat_spe

# 根据人数判断 line 增援线,且人数平衡(差距≤1)才开局
# =============
# line1: 1v1/1v2/2v1/2v2
# line2: 2v3/3v2/3v3
# =============
execute as @e[name=system,scores={stat_pot=1..3,stat_ear=1..3,stat_total=0},tag=!started_over] run scoreboard players set @s line 1
execute as @e[name=system,scores={stat_pot=1..3,stat_ear=4..6,stat_total=0},tag=!started_over] run scoreboard players set @s line 1
execute as @e[name=system,scores={stat_pot=4..6,stat_ear=1..3,stat_total=0},tag=!started_over] run scoreboard players set @s line 1
execute as @e[name=system,scores={stat_pot=4..6,stat_ear=4..6,stat_total=0},tag=!started_over] run scoreboard players set @s line 1

execute as @e[name=system,scores={stat_pot=4..6,stat_ear=7..9,stat_total=0},tag=!started_over] run scoreboard players set @s line 2
execute as @e[name=system,scores={stat_pot=7..9,stat_ear=4..6,stat_total=0},tag=!started_over] run scoreboard players set @s line 2
execute as @e[name=system,scores={stat_pot=7..9,stat_ear=7..9,stat_total=0},tag=!started_over] run scoreboard players set @s line 2

# 当人数平衡后开启 timer
execute as @e[name=system,scores={line=1..2},tag=!started_over] run function _cp3_system:start_timer_1

# 中断
execute as @e[name=system,tag=started,scores={stat_total=1..}] run function _cp3_system:pause