#> invtr:internal/advancement
#--------------------
# internal/tick
#--------------------

function pdata:api/get_self
data modify storage invtr:var change.last_items set from storage pdata:out get_self.result.storage.invtr.internal.last_items
data modify storage invtr:var change.current_items set from entity @s Inventory

#compare to end function early
data modify storage invtr:var change.check set from storage invtr:var change.last_items
execute store result score *change.match invtr_var run data modify storage invtr:var change.check set from storage invtr:var change.current_items
execute if score *change.match invtr_var matches 0 run return run function invtr:internal/end_early

data modify storage pdata:in merge_self.in.storage.invtr.internal.last_items set from storage invtr:var change.current_items
function pdata:api/merge_self with storage pdata:in merge_self

execute store result score *change.i invtr_var if data storage invtr:var change.current_items[]
execute if score *change.i invtr_var matches 1.. run function invtr:internal/iter

data modify storage invtr:var change.call.in.info.removed set from storage invtr:var change.last_items

#-- EVENT : on_inventory_change --
data modify storage invtr:var change.call.in.event set value "#invtr:event/on_inventory_change"
function gvent:api/call with storage invtr:var change.call
#------

data remove storage invtr:var change
scoreboard players reset *change.i invtr_var
scoreboard players reset *change.match invtr_var

return 1