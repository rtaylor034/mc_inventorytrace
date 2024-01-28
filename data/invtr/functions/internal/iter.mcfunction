#> invtr:internal/iter
#--------------------
# ./main
#--------------------

data modify storage invtr:var change.iter.item set from storage invtr:var change.current_items[-1]
function invtr:internal/iter.1 with storage invtr:var change.iter

data remove storage invtr:var change.current_items[-1]
scoreboard players remove *change.i invtr_var 1
execute if score *change.i invtr_var matches 1.. run function invtr:internal/iter