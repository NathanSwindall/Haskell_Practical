{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE PatternSynonyms #-}

module Chapter3.Ranges (Range(), range, pattern R_i, RangeObs(R), r) where 

--using smart constructors
data Range = Range Integer Integer deriving Show

range :: Integer -> Integer -> Range 
range a b = if a <=b then Range a b else error "a must be <= b"

data RangeObs = R Integer Integer deriving Show 

r :: Range -> RangeObs 
r (Range a b) = R a b

pattern R_i :: Integer -> Integer -> Range 
pattern R_i a b <- Range a b
       where R_i a b = range a b

--

