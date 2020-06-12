module Chapter3.FunctionsAsParameters where

--A cool way to eliminate parentheses 
maximum_mine :: Ord a => [a] -> Maybe a 
maximum_mine [] = Nothing
maximum_mine [x] = Just x 
maximum_mine xs = let max = foldl1 max_func xs
                  in Just max


--I think there might be a better way to solve the maximum problem
max_func a b
        | a > b = a 
        | otherwise = b

--my own foldl1
my_fold f [x]    = x
my_fold f (x:xs) = f x $ my_fold f xs


-- maximum (map succ [1,2,3])
