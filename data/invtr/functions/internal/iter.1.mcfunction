#> invtr:internal/iter.1

$execute store result score *change.match invtr_var run data remove storage invtr:var change.last_items[$(item)]

execute if score *change.match invtr_var matches 0 run data modify storage invtr:var change.call.in.info.added append from storage invtr:var change.iter.item