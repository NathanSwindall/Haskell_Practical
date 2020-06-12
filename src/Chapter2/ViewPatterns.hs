{-# LANGUAGE ViewPatterns #-}
-- Must have this to enable view patters
module Chapter2.ViewPatterns where

import Chapter2.DataTypes
import Chapter2.PatternMatching

--Just an example I thought of
data Family a = Father a | Son a | Daughter a | Mother a
                    deriving Show

responsibility :: Client -> String 
responsibility (Company _ _ _ r) = r 
responsibility _                 = "Unknown"

-- clientName2 :: Client -> String   returns the persons name as a string
-- This function is from the PatternMatching section

specialClient :: Client -> Bool 
specialClient (clientName2 -> "Mr. Alejandro" ) = True 
specialClient (responsibility -> "Director")    = True 
specialClient _                                 = False 

testSpecialClient :: Client
testSpecialClient = Company "Korea Electric" 1234 (Person "John" "Smith" Male) "Director"

testSpecialClient2 :: Client 
testSpecialClient2 = Individual (Person "Mr." "Alejandro" Male) True 

testSpecialClient3 :: Client
testSpecialClient3 = Individual (Person "Nathan" "Swindall" Male) True
