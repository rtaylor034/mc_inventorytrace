#> invtr:internal/advancement
#--------------------
# @advancement : inventory_change
#--------------------

function pdata:api/get_self
data modify storage invtr:var change.last_items set from storage pdata:out get_self.result.storage.invtr.internal.last_items
data modify storage invtr:var change.current_items set from entity @s Inventory

data modify storage pdata:in merge_self.in.storage.invtr.internal.last_items set from storage invtr:var change.current_items
function pdata:api/merge_self with storage pdata:in merge_self

execute store result score *change.i invtr_var if data storage invtr:var change.current_items[]
scoreboard players remove *change.i invtr_var 1
execute store result storage invtr:var change.iter.i int 1 run scoreboard players get *change.i invtr_var
execute if score *change.i invtr_var matches 0.. run function invtr:internal/iter with storage invtr:var change.iter

data modify storage gvent:in call.in.info.removed set from storage invtr:var change.last_items

#-- EVENT : on_inventory_change --
data modify storage gvent:in call.in.event set value "#invtr:event/on_inventory_change"
function gvent:api/call with storage gvent:in call
#------

data remove storage invtr:var change
scoreboard players reset *change.i invtr_var
scoreboard players reset *change.match invtr_var
advancement revoke @s only invtr:inventory_change