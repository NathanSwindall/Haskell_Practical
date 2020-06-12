module Chapter2.ListsAndTuples where

--using the as syntax
--before as syntax

sorted :: [Integer] -> Bool
sorted [] = True
sorted [_] = True
sorted (x:y:zs) = x < y && sorted (y:zs)

--with as
sorted_as :: [Integer] -> Bool
sorted_as [] = True 
sorted_as [_] = True 
sorted_as (x:rest@(y:_)) = x < y && sorted_as (rest)


--maxmin
--Interesting recursive example
maxmin [x] = (x,x)
maxmin (x:xs) = (if x > xs_max then x else xs_max,
                if x < xs_min then x else xs_min
                ) where (xs_max, xs_min) = maxmin xs