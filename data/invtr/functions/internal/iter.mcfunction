#> invtr:internal/iter
#--------------------
# ./advancement
#--------------------

$data modify storage invtr:var change.iter.item set from storage invtr:var change.current_items[$(i)]
function invtr:internal/iter.1 with storage invtr:var change.iter

scoreboard players remove *change.i invtr_var 1
execute store result storage invtr:var change.iter.i int 1 run scoreboard players get *change.i invtr_var
execute if score *change.i invtr_var matches 0.. run function invtr:internal/iter with storage invtr:var change.iter