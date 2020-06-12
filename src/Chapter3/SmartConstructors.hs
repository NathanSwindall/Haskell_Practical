{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ViewPatterns  #-}

module Chapter3.SmartConstructors 
                (metalResistor
                , pattern MR
                , pattern CR
                ) where

data Resistor = Metal Bands
              | Ceramic Bands 
              deriving Show 

type Bands = Int 


metalResistor :: Bands -> Resistor
metalResistor n | n < 4 || n > 8 = error "Invalid number of resistor bands"
                | otherwise      = Metal n

ceramicResistor :: Bands -> Resistor
ceramicResistor n | n < 4 || n > 8 = error "Invalid number of resistor bands"
                | otherwise      = Ceramic n
                
                
                

--We can actually create a smart constructor using patterns and then export it 
pattern MR :: Bands -> Resistor
pattern MR res <- Metal res
        where MR res = metalResistor res

pattern CR :: Bands -> Resistor 
pattern CR res <- Ceramic res 
         where CR res = ceramicResistor res

--Can we pattern match on this pattern
-- prettyResistor :: Resistor -> String
-- prettyResistor (MR num) = "The resistance is " ++ show num


--Pattern matching with patternSynonyms
prettyResistor res = case res of 
                      (CR num) -> "Hello" ++ show num
                      (MR num) -> "Hello metal" ++ show (num +1000)
                     