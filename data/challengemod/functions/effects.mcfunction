execute if entity @e[type=witherstormmod:wither_storm,distance=512..] run effect give @s minecraft:slowness 1 1
execute as @s[scores={clear_effect_tick=1..}] run effect clear @s witherstormmod:wither_sickness
execute as @s[scores={clear_effect_tick=1..}] run effect give @s minecraft:saturation 2 1
execute as @s[scores={clear_effect_tick=1..}] run particle minecraft:enchant ~ ~ ~ 1 1 1 0.25 2 normal