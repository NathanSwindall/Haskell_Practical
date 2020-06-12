module Chapter2.PatternMatching where

import Chapter2.DataTypes

clientName :: Client -> String
clientName client = case client of
                      GovOrg name                 -> name
                      Company name id person resp -> name
                      Individual person ads       ->
                          case person of
                              Person fNm lNm gender -> fNm ++ " " ++ lNm


testPerson = Individual (Person "Nathan" "Swindall" Male) False
testCompany = Company "Korea Electric" 123 (Person "Nathan"  "Swindall" Male) "Electric Stuff"


--The above definition has bindings we don't use
--This below definition has only the bindings we will use
clientName2 :: Client -> String
clientName2 client = case client of
                     GovOrg name           -> name
                     Company name _ _ _    -> name
                     Individual (Person fNm lNm _) _ -> fNm ++ " " ++ lNm


--What if we only care about the name for the company only
--How can we use pattern matching with wildcards to do this
companyName :: Client -> Maybe String 
companyName client = case client of
                      Company name _ _ _ -> Just name
                      _                  -> Nothing



--pattern matching with exact values
--You can pattern match with exact values like in the fibonacci sequence
fibonacci :: Integer -> Integer
fibonacci n = case n of
              0 -> 0
              1 -> 1
              _ -> fibonacci (n-1) + fibonacci (n - 2)

--problems with pattern matching

f :: Client -> String
f client = case client of
            Company _ _ (Person name _ _) "Boss" -> name ++ " is the boss"
            _                                    -> "There is no boss"

g :: Client -> String 
g client = case client of 
             Company _ _ (Person name _ _ ) pos -> 
                 case pos of "Boss" -> name ++ " is the boss"
             _                  -> "There is no boss"


--exercise
-- Keeping track of customer who are male or female
--returns the number of clients of each gender
--very inefficient code, goes through everything multple times
genderCounts :: [Client] -> Gender -> Int
genderCounts [] g = 0
genderCounts (c:cs) g = case c of 
                          Company _ _ (Person _ _ gender ) _ -> if gender == g 
                                                                then 1 + genderCounts cs g
                                                                else genderCounts cs g
                          Individual (Person _ _ gender) _ -> if gender == g 
                                                              then 1 + genderCounts cs g
                                                              else genderCounts cs g
                          _                                 -> genderCounts cs g

maleFemaleUnknown :: [Client] -> ((Gender,Int),(Gender, Int),(Gender,Int))
maleFemaleUnknown cs = ((Male, genderCounts cs Male)
                       ,(Female, genderCounts cs Female)
                       ,(Unknown, genderCounts cs Unknown))


testDataMFU = [(Company "Korean Electric" 123 (Person "John" "Smith" Male) "Boss")
              ,(Individual (Person "Nathan" "Swindall" Male ) True)
              ,(Company "Korean Electric" 123 (Person "John" "Smith" Male) "Boss")
              ,(Individual (Person "Nathan" "Swindall" Unknown ) True)
              ,(Company "Korean Electric" 123 (Person "John" "Smith" Female) "Boss")
              ,(Individual (Person "Nathan" "Swindall" Female ) True)
              ,(Company "Korean Electric" 123 (Person "John" "Smith" Male) "Boss")
              ,(Individual (Person "Nathan" "Swindall" Male ) True)
              ,(Company "Korean Electric" 123 (Person "John" "Smith" Male) "Boss")
              ,(Individual (Person "Nathan" "Swindall" Female ) True) ]


--Write a function that , given a list of time machines, decreases their prive by
-- a certain percentage

future_timeMachine :: TimeMachine
future_timeMachine = TimeMachine {
    manufacturer = "Korea",
    model = 1111,
    name_machine = "United Front",
    price = 43000.32,
    travel = Future
}


discount_TimeMachine :: Float -> TimeMachine -> TimeMachine
discount_TimeMachine dis tm = tm {price = (price tm) * dis}

discount_TimeMachineList :: [TimeMachine] -> Float -> [TimeMachine]
discount_TimeMachineList tms dis = map (discount_TimeMachine dis) tms


