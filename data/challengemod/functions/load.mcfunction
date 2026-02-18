#Set player
attribute @s minecraft:generic.max_health base set 1
gamemode adventure
give @s minecraft:flint{CanDestroy:["minecraft:oak_log","minecraft:sand","minecraft:wither_skeleton_skull","minecraft:wither_skeleton_wall_skull"]} 1
#Set world
time set midnight
weather clear
worldborder set 4096
#Set rules
gamerule doDaylightCycle false
gamerule doMobSpawning false
gamerule doPatrolSpawning false
gamerule doTraderSpawning false
gamerule doWardenSpawning false
gamerule doWeatherCycle false
#Set scores
scoreboard objectives add clear_effect_tick dummy
scoreboard objectives add generation_tick dummy
scoreboard objectives add wither_x dummy
scoreboard objectives add wither_z dummy

