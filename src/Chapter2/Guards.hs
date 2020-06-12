module Chapter2.Guards where

ifibonacci :: Integer -> Maybe Integer 
ifibonacci n = if n < 0 
               then Nothing 
               else case n of 
                   0 -> Just 0 
                   1 -> Just 1 
                   n' -> let Just f1 = ifibonacci (n'-1) --notice that you took the value out right here
                             Just f2 = ifibonacci (n'-2)
                         in Just ( f1 + f2)



--This function will fail and loop infinitely
binom _ 0 = 1 
binom n k = if n == k
            then 1
            else (binom (n-1) (k-1)) + (binom (n-1) k)

--With guards we can complete these two functions
--Guards allow backtracking unlike pattern matching and the case n of statement
ifibonacci_guards n | n < 0           = Nothing
ifibonacci_guards 0                   = Just 0 
ifibonacci_guards 1                   = Just 1
ifibonacci_guards n | otherwise       = let Just f1 = ifibonacci_guards (n-1)
                                            Just f2 = ifibonacci_guards (n-2)
                                        in Just (f1 + f2)


binomg _ 0           = 1
binomg  x y | x == y = 1
binomg  n k          = (binomg (n-1) k ) + (binomg (n-1) k)


multipleOf :: Integer -> Integer -> Bool
multipleOf x y = ( mod x y ) == 0

specialMultiples :: Integer -> String 
specialMultiples n | multipleOf n 2 = show n ++ " is multiple of 2"
specialMultiples n | multipleOf n 3 = show n ++ " is multiple of 3"
specialMultiples n | multipleOf n 5 = show n ++ " is multiple of 5"
specialMultiples n | otherwise      = show n ++ " is a beautiful number"


-- You can also do a more condensed version
specialMultiples_condensed :: Integer -> String 
specialMultiples_condensed n 
 | multipleOf n 2 = show n ++ " is multiple of 2"
 | multipleOf n 3 = show n ++ " is multiple of 3"
 | multipleOf n 5 = show n ++ " is multiple of 5"
 | otherwise      = show n ++ " is a beautiful number"




 --Exercises 
 --Define the Ackerman equation

 --Define the unzip function