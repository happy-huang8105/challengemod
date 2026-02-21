#Set items
execute as @a if data entity @s {SelectedItem:{id:"minecraft:wither_skeleton_skull"}} unless data entity @s {SelectedItem:{tag:{CanPlaceOn: ["minecraft:command_block"]}}} run item modify entity @s weapon.mainhand challengemod:place_on_command_block
execute as @a if data entity @s {SelectedItem:{id:"minecraft:crafting_table"}} unless data entity @s {SelectedItem:{tag:{CanPlaceOn: ["minecraft:bedrock"]}}} run item modify entity @s weapon.mainhand challengemod:place_on_bedrock
execute as @a if data entity @s {SelectedItem:{id:"minecraft:anvil"}} unless data entity @s {SelectedItem:{tag:{CanPlaceOn: ["minecraft:bedrock"]}}} run item modify entity @s weapon.mainhand challengemod:place_on_bedrock
execute as @a run function challengemod:clear
#Set scores
execute as @a[scores={clear_effect_tick=1..}] run scoreboard players remove @s clear_effect_tick 1
#Set effects
execute as @a at @s run function challengemod:effects
execute as @a if data entity @s {Inventory:[{id:"witherstormmod:command_block_book",Slot:-106b}]} run function challengemod:use_book
#Generate resources
execute as @e[type=minecraft:lightning_bolt] at @s unless entity @e[type=drowned,distance=..2] summon minecraft:drowned run effect give @s minecraft:fire_resistance infinite 0
#Wither functions
execute as @e[type=witherstormmod:wither_storm] unless data entity @s {Invul:0} run function challengemod:wither/wither_pos
execute as @e[type=witherstormmod:wither_storm] store result score @s wither_phase run data get entity @s Phase
execute as @e[type=witherstormmod:wither_storm,scores={wither_phase=0..2}] run function challengemod:wither/wither_fix
execute as @e[type=witherstormmod:wither_storm,scores={wither_phase=4..7}] run function challengemod:wither/wither_evolve