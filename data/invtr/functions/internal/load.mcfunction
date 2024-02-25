#>invtr:internal/load
#--------------------
# @LOAD
#--------------------

#declare storage invtr:var

scoreboard players set *invtr load.status 1

scoreboard objectives add invtr_var dummy

schedule clear invtr:internal/tick
schedule function invtr:internal/tick 1t