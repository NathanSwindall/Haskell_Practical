module Chapter3.Folds where 

data InfNumber a = MinusInfinity
                 | Number a 
                 | PlusInfinity 
                 deriving Show

infMax MinusInfinity x = x
infMax x MinusInfinity = x 
infMax PlusInfinity _  = PlusInfinity 
infMax _ PlusInfinity  = PlusInfinity 
infMax (Number a) (Number b) = Number (max a b)

test_list = [1,2,3,4,5,6,7,8,100,120,20,54]

test_fold = foldr (\x y -> infMax (Number x) y) MinusInfinity test_list


--Exercises 
--Solve with folds and pattern matching
--minimumClient 
--product
--all
--minimumBy