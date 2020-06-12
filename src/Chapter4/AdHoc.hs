{-# LANGUAGE RecordWildCards #-}

module Chapter4.AdHoc where 

class Nameable n where
    name :: n -> String

class Priceable p where
    totalPrice :: [p] -> Double

initial :: Nameable n => n -> Char 
initial n = head (name n)


data Person = Person {firstName :: String, lastName :: String} 
                 deriving (Show, Eq, Ord)

data Client i = GovOrg {clientId :: i, clientName :: String}
               | Company {clientId :: i, clientName :: String
                         , person :: Person, duty :: String}
               | Individual { clientId :: i, person :: Person}
               deriving (Show, Eq)

data TimeMachine = TimeMachine {
        manufacturer :: String,
        model :: Integer,
        name_machine :: String,
        price :: Double,
        travel :: Travel
        } deriving (Show,Eq, Ord)

data Travel = Past | Future deriving (Eq, Ord,Show)

--create an instance
--must use whole type


--create instances of the objects
instance Nameable (Client i) where 
    name Individual {person = Person {..}}
              = firstName ++ " " ++ lastName
    name c = clientName c

instance Priceable (TimeMachine) where
    totalPrice = foldr (\x y -> (price x) + y) 0

a_person = Individual 1232 (Person "Nathan" "Swindall")

twoTimeMachines = [TimeMachine {
    manufacturer = "Korea",
    model = 123,
    name_machine = "Seoul Revisiter",
    price = 999.90,
    travel = Past
}, TimeMachine {
    manufacturer = "North Korea",
    model = 111,
    name_machine = "Pyeonyang Revister 1.0",
    price = 90000,
    travel = Future
}]


--Interesting example for complex numbers
data Complex = C Double Double deriving (Show, Eq)

instance Num Complex where 
    (C a1 b1) + (C a2 b2) = C (a1 + a2) (b1 + b2)
    (C a1 b1) - (C a2 b2) = C (a1 - a1) (b1 - b2)
    (C a1 b1) * (C a2 b2) = C (a1 *a2 - b1 * b2) (a1*b2 + b1*a2)
    negate (C a b)        = C (negate a) (negate b)
    fromInteger n         = C (fromInteger n) 0
    abs (C a b)           = C (sqrt $ a*a + b*b) 0
    signum c@(C a b)      = let C n _ = abs c in C (a/n) (b /n)


instance Eq a => Ord (Client a) where
    compare a b
         | client1_name == client2_name  = individualsFirst a b
         | client1_name <= client2_name  = LT
         | otherwise                     = GT
         where client1_name = getClientName a
               client2_name = getClientName b



getClientName (Individual {..}) = firstName (person) ++ " " ++ lastName (person)
getClientName name = clientName name

isIndividual n = case n of 
                     Individual {..} -> True 
                     _               -> False

individualsFirst client1 client2
    | cl1 && cl2         = EQ 
    | cl1 && not cl2     = GT 
    | not cl1 && cl2     = LT 
    | otherwise          = EQ
    where cl1 = isIndividual client1
          cl2 = isIndividual client2


--test cases
myIndy = Individual 111 (Person "Nathan" "Swindall")
myGovy = GovOrg 123 "Nathan Swindall"