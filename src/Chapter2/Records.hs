{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}

module Chapter2.Records where 

import Data.Char
import Chapter2.DataTypes

data ClientR = GovOrgR { clientRName :: String }
             | CompanyR { clientRName :: String 
                        , companyId :: Integer
                        , person :: PersonR
                        , duty :: String}
             | IndividualR {person :: PersonR}
             deriving (Eq, Show) 

data PersonR = PersonR { firstName :: String
                       , lastName :: String 
                       } deriving (Eq, Show)






--Matching on Records
greet :: ClientR -> String 
greet IndividualR { person = PersonR { firstName = fn}} ="Hi, " ++ fn 
greet CompanyR    { clientRName = c} = "Hi, " ++ c 
greet GovOrgR     { clientRName = c}                 = "Welcome " ++ c

--No we can futhre simplify this with the NamedFieldPuns 

greet_puns IndividualR {person = PersonR {firstName}} = "Hi, " ++ firstName
greet_puns CompanyR    {clientRName} = "Hi, " ++ clientRName 
greet_puns GovOrgR     {}            = "Welcome"

--We can further simplify this with recordwildcards
greet_wild IndividualR {person = PersonR {..}} = "Hi, " ++ firstName
greet_wild CompanyR {..}                       = "Hi, " ++ clientRName
greet_wild GovOrgR  {}                         = "Welcome"


--Now what if we want to update one field 
nameInCapitals :: PersonR -> PersonR
nameInCapitals p@(PersonR {firstName = initial:rest}) = 
    let newName = (toUpper initial):rest 
    in  p {firstName = newName}
nameInCapitals p@(PersonR {firstName = ""}) = p


--Now a function will do All Caps
allCaps :: PersonR -> PersonR
allCaps p@(PersonR {..}) = 
    let newFirstName = map toUpper firstName
        newLastName = map toUpper lastName
    in p {firstName = newFirstName, lastName = newLastName}
--allCaps p@(PersonR {firstName = ""}) = p --redundant


--Now to update the prices in timeMachine 
updatePrice :: TimeMachine -> Float -> TimeMachine 
updatePrice p@(TimeMachine {..}) dis = 
    let newPrice = dis * price
    in p { price = newPrice }




testClientR = IndividualR { person = PersonR {firstName = "Nathan", lastName = "Swindall"}}


changeName :: ClientR -> ClientR 
changeName p@(IndividualR {person = PersonR {lastName = ln}}) = p {person = PersonR {firstName = "Johnson", lastName = ln }}




