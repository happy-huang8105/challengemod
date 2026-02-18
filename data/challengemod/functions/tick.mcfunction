#Set items
execute as @a[nbt={SelectedItem:{id:"minecraft:wither_skeleton_skull"}}] unless entity @s[nbt={SelectedItem:{tag:{CanPlaceOn: ["minecraft:command_block"]}}}] run item modify entity @s weapon.mainhand challengemod:place_on_command_block
execute as @a[nbt={SelectedItem:{id:"minecraft:crafting_table"}}] unless entity @s[nbt={SelectedItem:{tag:{CanPlaceOn: ["minecraft:bedrock"]}}}] run item modify entity @s weapon.mainhand challengemod:place_on_bedrock
execute as @a[nbt={SelectedItem:{id:"minecraft:anvil"}}] unless entity @s[nbt={SelectedItem:{tag:{CanPlaceOn: ["minecraft:bedrock"]}}}] run item modify entity @s weapon.mainhand challengemod:place_on_bedrock
#Set scores
execute as @a[scores={stage=1}] run scoreboard players add @s generation_tick 1
execute as @a[scores={generation_tick=4096}] run scoreboard players set @s generation_tick 0
execute as @a[scores={clear_effect_tick=1..}] run scoreboard players remove @s clear_effect_tick 1
#Set effects
execute as @a at @s run function challengemod:effects
execute as @a[nbt={Inventory:[{id:"witherstormmod:command_block_book",Slot:-106b}]}] run function challengemod:use_book
#Generate resources
execute as @e[type=witherstormmod:flaming_wither_skull] at @s if entity @a[scores={generation_tick=2047},distance=..16] run function challengemod:generations/blaze_generation
execute as @e[type=witherstormmod:flaming_wither_skull] at @s if entity @a[scores={generation_tick=4095},distance=..16] run function challengemod:generations/blaze_generation
execute as @a[scores={generation_tick=4095}] at @s unless entity @e[type=witherstormmod:wither_storm,distance=..256] run function challengemod:generations/log_generation
execute as @e[type=witherstormmod:block_cluster] at @s if entity @a[scores={generation_tick=4095},distance=..16] run summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:sand"}}
execute as @e[type=minecraft:lightning_bolt] at @s unless entity @e[type=drowned,distance=..2] summon minecraft:drowned run effect give @s minecraft:fire_resistance infinite 0
#Fix wither
execute as @e[type=witherstormmod:wither_storm] unless entity @s[nbt={Invul:0}] run function challengemod:wither/wither_pos
execute as @e[type=witherstormmod:wither_storm] unless entity @s[nbt={Phase:3}] unless entity @s[nbt={Phase:4}] unless entity @s[nbt={Phase:5}] unless entity @s[nbt={Phase:6}] unless entity @s[nbt={Phase:7}] run function challengemod:wither/wither_fix