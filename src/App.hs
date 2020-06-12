module App where

--{-# LANGUAGE ViewPatterns #-}

-- import Chapter2.DataTypes
-- import Chapter2.PatternMatching
-- import Chapter2.ListsAndTuples
-- import Chapter2.Guards
-- import Chapter2.ViewPatterns
-- import Chapter2.Records
-- import Chapter3.AnonymousFunctions
-- import Chapter3.Ranges
import Chapter3.SmartConstructors 
import Network.HTTP.Simple
import qualified Data.HashMap.Lazy as LM

--Working with ranges and view partterns
--This is pretty cool
--The prettyRange is just showing how to match when you didn't export the 
--constructor
-- prettyRange :: Range -> String 
-- prettyRange rng = case rng of 
--                      (r-> R a b) -> "[" ++ show a ++ "," ++ show b ++ "]"

a = LM.fromList [("hello",1)]
