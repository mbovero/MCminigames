###Hill
execute as @a at @s if block ~ ~-0.9 ~ gold_block run scoreboard players add @s Score 1
execute as @a at @s if block ~ ~-0.9 ~ gold_block run effect give @s glowing 1 255 true
execute as @a at @s if block ~ ~-1.9 ~ gold_block run scoreboard players add @s Score 1
execute as @a at @s if block ~ ~-1.9 ~ gold_block run effect give @s glowing 1 255 true

###Void
execute as @a at @s if entity @s[y=0,dy=-5] run gamerule showDeathMessages false
execute as @a at @s if entity @s[y=0,dy=-5] run kill @s
execute as @a at @s if entity @s[y=0,dy=-5] run gamerule showDeathMessages true

###No Hunger
execute as @a[nbt={foodLevel:19}] run effect give @s saturation 1 1 true
execute as @a[nbt={foodLevel:17}] run effect give @s saturation 1 1 true

###Prevent Cheating/Collaboration     -   better alternative? yes - in to do app
kill @e[type=item]


###Game Timer
#count down display
scoreboard players add @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]}] TickTime 1
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=1}] run tellraw @a ["",{"text":"Game ends in ","bold":true},{"text":"5","bold":true,"color":"gold"},{"text":" mins","bold":true}]
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=1200}] run tellraw @a ["",{"text":"Game ends in ","bold":true},{"text":"4","bold":true,"color":"gold"},{"text":" mins","bold":true}]
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=2400}] run tellraw @a ["",{"text":"Game ends in ","bold":true},{"text":"3","bold":true,"color":"gold"},{"text":" mins","bold":true}]
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=3600}] run tellraw @a ["",{"text":"Game ends in ","bold":true},{"text":"2","bold":true,"color":"gold"},{"text":" mins","bold":true}]
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=4800}] run tellraw @a ["",{"text":"Game ends in ","bold":true},{"text":"1","bold":true,"color":"dark_red"},{"text":" min","bold":true}]
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5400}] run tellraw @a ["",{"text":"Game ends in ","bold":true},{"text":"30","bold":true,"color":"dark_red"},{"text":" seconds","bold":true}]
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5700}] run tellraw @a ["",{"text":"Game ends in ","bold":true},{"text":"15","bold":true,"color":"dark_red"},{"text":" seconds!","bold":true}]
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5900}] run tellraw @a {"text":"5","bold":true,"color":"red"}
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5900}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 2
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5920}] run tellraw @a {"text":"4","bold":true,"color":"red"}
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5920}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 1.8
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5940}] run tellraw @a {"text":"3","bold":true,"color":"red"}
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5940}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 1.6
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5960}] run tellraw @a {"text":"2","bold":true,"color":"red"}
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5960}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 1.4
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5980}] run tellraw @a {"text":"1","bold":true,"color":"red"}
    execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=5980}] run playsound block.note_block.chime master @a ~ ~ ~ 9999999999999999999999999 .1
#end game at end of timer
execute if entity @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},limit=1,scores={TickTime=6000..}] run scoreboard players set bool KOTHend 1
kill @e[type=area_effect_cloud,nbt={Tags:["five_min_timer"]},scores={TickTime=6000..}]
execute if score bool KOTHend matches 1 run function mgdp:koth/end


###Random Spawns
execute if score map KOTHmap matches 0 run spreadplayers 8 -1200 3 100 under 11 false @e[type=area_effect_cloud,tag=spawn]
execute if score map KOTHmap matches 1 run spreadplayers -900 0 3 100 under 12 false @e[type=area_effect_cloud,tag=spawn]
execute at @e[type=area_effect_cloud,tag=spawn] as @a[tag=queued] run spawnpoint



#####Kits
#clear on death
execute as @e[type=player,scores={Deaths=1..},tag=queued] as @s run clear @s

##Striker
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=10},tag=queued] as @s run function mgdp:koth/kits/10striker/10striker
    #kill super reward
    execute as @a[scores={KOTHkit=10,KillsSuper=5..},tag=queued] as @s run give @s minecraft:potion{Potion:"minecraft:water",CustomPotionEffects:[{Id:11,Amplifier:2,Duration:200}],display:{Name:'"Super Resistance Pot"'}}
    execute as @a[scores={KOTHkit=10,KillsSuper=5..},tag=queued] as @s run playsound minecraft:block.anvil.use master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=10,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0

##Orc
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=11},tag=queued] as @s run function mgdp:koth/kits/11orc
    #kill reward
    execute as @a[scores={KOTHkit=11,Kills=3..},tag=queued] as @s run give @s minecraft:potion{CustomPotionEffects:[{Id:10,Amplifier:3,Duration:400,Ambient:1b},{Id:5,Amplifier:1,Duration:400,Ambient:1b}],CustomPotionColor:11299688,display:{Name:'"Orc Boost Pot"'}}
    execute as @a[scores={KOTHkit=11,Kills=3..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill reward 2
    execute as @a[scores={KOTHkit=11,Kills2=5..},tag=queued] as @s run give @s minecraft:potion{CustomPotionEffects:[{Id:11,Duration:600,Ambient:1b}],CustomPotionColor:9131600,display:{Name:'"Orc Resistance Pot"'}}
    execute as @a[scores={KOTHkit=11,Kills2=5..},tag=queued] as @s run scoreboard players set @s Kills2 0
    #kill super reward
    #execute as @a[scores={KOTHkit=11,KillsSuper=5..},tag=queued] as @s 
        #trying to make it so the item can be used 3 times to groundpound around them


##Knight
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=20},tag=queued] as @s run function mgdp:koth/kits/20knight
    #kill reward
    execute as @a[scores={KOTHkit=20,Kills=3..},tag=queued] as @s run give @s shield{Damage:250} 1
    execute as @a[scores={KOTHkit=20,Kills=3..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill super reward
    execute as @a[scores={KOTHkit=20,KillsSuper=5..},tag=queued] as @s run give @s minecraft:potion{Potion:"minecraft:water",CustomPotionEffects:[{Id:10,Amplifier:3,Duration:200}],display:{Name:'"Super Regen Pot"'}}
    execute as @a[scores={KOTHkit=20,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.witch.drink master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=20,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0

##Archer
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=30},tag=queued] as @s run function mgdp:koth/kits/30archer
    #kill reward
    execute as @a[scores={KOTHkit=30,Kills=3..},tag=queued] as @s run give @s arrow 10
    execute as @a[scores={KOTHkit=30,Kills=3..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill super reward
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run give @s bow{Damage:379,Enchantments:[{id:"punch",lvl:3},{id:"power",lvl:5}],display:{Name:'"Super Bow"'}}
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.villager.work_fletcher master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=30,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0

##Sniper
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=31},tag=queued] as @s run function mgdp:koth/kits/31sniper
    #kill reward
    execute as @a[scores={KOTHkit=31,Kills=3..},tag=queued] as @s run give @s arrow 6
    execute as @a[scores={KOTHkit=31,Kills=3..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill super reward
    execute as @a[scores={KOTHkit=31,KillsSuper=5..},tag=queued] as @s run give @s crossbow{display:{Name:'{"text":"Super Rocket Launcher"}'},Damage:464,ChargedProjectiles:[{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:20b,Explosions:[{Type:1,Colors:[I;16711680]},{Type:1,Colors:[I;16744448]},{Type:1,Colors:[I;16763904]},{Type:1,Colors:[I;16777215]},{Type:1,Colors:[I;11776947]},{Type:0,Colors:[I;16736003]},{Type:1,Colors:[I;4539717]},{Type:1,Colors:[I;16727040]},{Type:1,Colors:[I;16765468]},{Type:1,Colors:[I;16711680]},{Type:1,Colors:[I;13750737]}]}}},{},{}],Charged:1b} 1
    execute as @a[scores={KOTHkit=31,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.firework_rocket.large_blast_far master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=31,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0
    #slowness when holding bow
    execute as @a[scores={KOTHkit=31},tag=queued,nbt={SelectedItem:{id:"minecraft:bow",tag:{display:{Name:'"Sniper"'}}}}] run effect give @s minecraft:slowness 1 4 true
    execute as @a[scores={KOTHkit=31},tag=queued,nbt={Inventory:[{Slot:-106b,id:"minecraft:bow",tag:{display:{Name:'"Sniper"'}}}]}] run effect give @s minecraft:slowness 1 4 true

##Warper
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=40},tag=queued] as @s run function mgdp:koth/kits/40warper
    #kill reward
    execute as @a[scores={KOTHkit=40,Kills=1..},tag=queued] as @s run give @s ender_pearl{display:{Name:'"Tp Random Location"'}}
    execute as @a[scores={KOTHkit=40,Kills=1..},tag=queued] as @s run scoreboard players set @s Kills 0
    #kill reward 2
    execute as @a[scores={KOTHkit=40,Kills2=4..},tag=queued] as @s run give @s ender_pearl{display:{Name:'"Randomize All Player Locations"'}}
    execute as @a[scores={KOTHkit=40,Kills2=4..},tag=queued] as @s run scoreboard players set @s Kills2 0
    #kill super reward
    execute as @a[scores={KOTHkit=40,KillsSuper=5..},tag=queued] as @s run give @s ender_pearl{display:{Name:'"Tp Highest Player"'},Enchantments:[{id:"",lvl:1}]}
    execute as @a[scores={KOTHkit=40,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.enderman.death master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=40,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0
    #tp random location pearl
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Random Location"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] at @s run spreadplayers ~ ~ 10 100 false @s
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Random Location"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 9999999 1.5
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Random Location"'}}}},limit=1] run kill @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Random Location"'}}}}]
    #randomize player locations pearl
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Randomize All Player Locations"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] at @s run spreadplayers ~ ~ 5 70 false @a[tag=queued]
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Randomize All Player Locations"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 9999999 1
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Randomize All Player Locations"'}}}},limit=1] run kill @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Randomize All Player Locations"'}}}}]
    #Tp Highest Player pearl
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run execute as @a[tag=queued] run execute store result score @s ylevel run data get entity @s Pos[1]
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run scoreboard players set max ylevel -1000
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run scoreboard players operation max ylevel > @a[tag=queued] ylevel
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run execute as @a[tag=queued] if score @s ylevel = max ylevel run tag @s add WarperTarget
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run tp @p[tag=WarperTarget]
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 9999999 .7
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run tag @a remove WarperTarget 
    execute if entity @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}},limit=1] run kill @e[type=minecraft:ender_pearl,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:'"Tp Highest Player"'}}}}]
    #reset pearl detection
    execute as @a[scores={KOTHkit=40,PearlUsed=1},tag=queued] run scoreboard players reset @s PearlUsed

##Fisherman
    execute as @e[type=player,scores={Deaths=1..,KOTHkit=50},tag=queued] as @s run function mgdp:koth/kits/50fisherman
    #kill super reward
    execute as @a[scores={KOTHkit=50,KillsSuper=5..},tag=queued] as @s run give @s golden_chestplate{display:{Name:'"Super Pufferfish Chestplate"'},Enchantments:[{id:"thorns",lvl:20}],Damage:92}
    execute as @a[scores={KOTHkit=50,KillsSuper=5..},tag=queued] as @s run playsound minecraft:entity.puffer_fish.blow_up master @a ~ ~ ~ 9999999 .7
    execute as @a[scores={KOTHkit=50,KillsSuper=5..},tag=queued] as @s run scoreboard players set @s KillsSuper 0





###Reset detection for respawn
#reset kill streak
scoreboard players reset @e[type=player,tag=queued,scores={Deaths=1..}] KillsSuper
#reset deaths
scoreboard players reset @e[type=player,tag=queued,scores={Deaths=1..}] Deaths
