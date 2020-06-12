module Chapter2.DataTypes  where

data Client1 = GovOrg1 String
            | Company1 String Integer String String
            | Individual1 String String Bool
            deriving Show

-- Adding an ADT inside another ADT    
data Client = GovOrg String
             | Company String Integer Person String
             | Individual Person Bool
             deriving Show
             
data Person = Person String String Gender
            deriving Show 

--Gender type is similiar to enumerations
data Gender = Male | Female | Unknown deriving (Show, Eq)


data TimeMachine = TimeMachine {
    manufacturer :: String,
    model :: Integer,
    name_machine :: String,
    price :: Float,
    travel :: Travel
} deriving (Show)


data Travel = Past | Future deriving Show

