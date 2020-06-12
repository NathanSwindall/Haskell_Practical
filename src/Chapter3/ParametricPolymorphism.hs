module Chapter3.ParametricPolymorphism where


data Client i = GovOrg { clientId:: i, clientName :: String}
              | Company { clientId :: i, clientName :: String 
                        , person :: Person, duty :: String }
              | Individual { clientId :: i, person :: Person }
              deriving (Show, Eq, Ord)

data Person = Person { firstName :: String, lastName :: String}
              deriving (Show, Eq, Ord)

data Triple a b c = Triple a b c


data Triple_Same a = Triple_Same a a a

--This function will index stuff
index [] = []
index [x] = [(0,x)]
index (x:xs) = let indexed@((n,_): _) = index xs
               in  (n+1,x):indexed


