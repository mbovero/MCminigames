###Hill
execute as @a at @s if block ~ ~-0.2 ~ gold_block run scoreboard players add @s Score 1
execute as @a at @s if block ~ ~-0.2 ~ gold_block run effect give @s glowing 1 255 true
execute as @a at @s if block ~ ~-2 ~ gold_block run scoreboard players add @s Score 1
execute as @a at @s if block ~ ~-2 ~ gold_block run effect give @s glowing 1 255 true

###Void
execute as @a at @s if entity @s[y=0,dy=-5] run kill @s

###No Hunger
execute as @a[nbt={foodLevel:19}] run effect give @s saturation 1 1 true
execute as @a[nbt={foodLevel:17}] run effect give @s saturation 1 1 true


###Game Timer
#count down display
scoreboard players add @e[type=armor_stand,nbt={Tags:["five_min_timer"]}] TickTime 1
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=0}] run tellraw @a "Game ends in 5 mins"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=1200}] run tellraw @a "Game ends in 4 mins"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=2400}] run tellraw @a "Game ends in 3 mins"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=3600}] run tellraw @a "Game ends in 2 mins"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=4800}] run tellraw @a "Game ends in 1 min"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5400}] run tellraw @a "Game ends in 30 seconds!"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5700}] run tellraw @a "Game ends in 15 seconds!"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5900}] run tellraw @a "5"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5900}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 2
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5920}] run tellraw @a "4"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5920}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 1.8
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5940}] run tellraw @a "3"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5940}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 1.6
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5960}] run tellraw @a "2"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5960}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 1.4
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5980}] run tellraw @a "1"
    execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5980}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 .1
#end game at end of timer
execute if entity @e[type=armor_stand,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=6000..}] run scoreboard players set bool KOTHend 1
kill @e[type=armor_stand,nbt={Tags:["five_min_timer"]},scores={TickTime=6000..}]
execute if score bool KOTHend matches 1 run function mgdp:koth/end


###Random Spawns
team empty 1
team empty 2
team empty 3
team empty 4
team join 1 @r[team=,tag=queued]
team join 2 @r[team=,tag=queued]
team join 3 @r[team=,tag=queued]
team join 4 @r[team=,tag=queued]
team join 1 @r[team=,tag=queued]
team join 2 @r[team=,tag=queued]
team join 3 @r[team=,tag=queued]
team join 4 @r[team=,tag=queued]
execute as @a[team=1] run spawnpoint @s 8 11 -1194
execute as @a[team=2] run spawnpoint @s 2 11 -1200
execute as @a[team=3] run spawnpoint @s 8 11 -1206
execute as @a[team=4] run spawnpoint @s 14 11 -1200



#####Kits
##Striker
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=10},tag=queued] as @s run function mgdp:koth/kits/10striker

##Tank
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=20},tag=queued] as @s run function mgdp:koth/kits/20tank
    #kill reward
    execute as @a[scores={KOTHkit=10,Kills=3..},tag=queued] as @s run give @s shield{Damage:250} 1
    execute as @a[scores={KOTHkit=10,Kills=3..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill super reward
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run give @s minecraft:potion{Potion:"minecraft:water",CustomPotionEffects:[{Id:10,Amplifier:3,Duration:200}],display:{Name:'"Super Regen Pot"'}}
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.witch.drink master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0

##Archer
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=30},tag=queued] as @s run function mgdp:koth/kits/30archer
    #kill reward
    execute as @a[scores={KOTHkit=30,Kills=3..},tag=queued] as @s run give @s arrow 10
    execute as @a[scores={KOTHkit=30,Kills=3..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill super reward
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run give @s bow{Damage:379,Enchantments:[{id:"punch",lvl:3},{id:"power",lvl:5}],display:{Name:'"Super Bow"'}}
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.villager.work_fletcher master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0

##Warper
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=40},tag=queued] as @s run function mgdp:koth/kits/40warper
    #kill reward
    execute as @a[scores={KOTHkit=40,Kills=1..},tag=queued] as @s run give @s ender_pearl{display:{Name:'"Tp Random Player"'}}
    execute as @a[scores={KOTHkit=40,Kills=1..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill reward 2
    execute as @a[scores={KOTHkit=40,Kills2=3..},tag=queued] as @s run give @s ender_pearl{display:{Name:'"Randomize Player Locations"'}}
    execute as @a[scores={KOTHkit=40,Kills2=3..},tag=queued] as @s run scoreboard players set @s Kills2 0
    #kill super reward
    execute as @a[scores={KOTHkit=40,KillsSuper=5..},tag=queued] as @s run give @s ender_pearl{display:{Name:'"Tp Highest Scoring Player"'},Enchantments:[{id:"",lvl:1}]}
    execute as @a[scores={KOTHkit=40,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.enderman.death master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=40,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0
    #tp @r pearl
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Random Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run tp @r[tag=queued]
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Random Player"'}}}},limit=1] run kill @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Random Player"'}}}}]
    #randomize player locations pearl
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Randomize Player Locations"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] at @s run spreadplayers ~ ~ 7 100 false @a[tag=queued]
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Randomize Player Locations"'}}}},limit=1] run kill @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Randomize Player Locations"'}}}}]
    #tp highest scoring player pearl
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Scoring Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run scoreboard players operation max Score > @a Score
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Scoring Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run execute as @a if score @s Score = max Score run tag @s add WarperTarget
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Scoring Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run scoreboard players reset max Score
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Scoring Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run tp @p[tag=WarperTarget]
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Scoring Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run tag @a remove WarperTarget 
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Scoring Player"'}}}},limit=1] run kill @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Scoring Player"'}}}}]

    
    
    

    #reset pearl detection
    execute as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run scoreboard players reset @s PearlUsed

##Fisherman
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=50},tag=queued] as @s run function mgdp:koth/kits/50fisherman
    #kill super reward
    execute as @a[scores={KOTHkit=50,KillsSuper=5..},tag=queued] as @s run give @s golden_chestplate{display:{Name:'"Super Pufferfish Chestplate"'},Enchantments:[{id:"thorns",lvl:20}],Damage:102}
    execute as @a[scores={KOTHkit=50,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.puffer_fish.blow_up master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=50,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0





###Reset detection for respawn
#reset kill streak
scoreboard players reset @e[type=player,tag=queued,scores={Deaths=1..}] KillsSuper
#reset deaths
scoreboard players reset @e[type=player,tag=queued,scores={Deaths=1..}] Deaths
