{-# LANGUAGE RecordWildCards #-}

module Chapter4.MySets where

import qualified Data.Set as S
import qualified Data.Map as M
--import qualified Data.Set as IntSet
import qualified Data.HashMap.Lazy as HM
import Chapter3.ParametricPolymorphism


mySet = S.insert "welcom" $ S.singleton "hello"

--convert to list 
myList = S.toList mySet

--How to remove duplicates 
myDuplicateList = ["hello", "hello", "johnny", "johnny", "johnny","nathan","nathan"]
noDuplicates = S.toList $ S.fromList myDuplicateList --This is much more performant



data ClientKind = GovOrgKind | CompanyKind | IndividualKind deriving (Eq,Ord, Show)


government = [GovOrg 1223 "Korean Tech Systems"]

classifyClients :: [Client Integer] -> M.Map ClientKind (S.Set (Client Integer))
classifyClients i = M.fromList [(GovOrgKind, (S.singleton (GovOrg 1223 "Korean Tech Systems")))]

--This will go through each element at a time and add a new thing
classifyClients1 :: [Client Integer] -> M.Map ClientKind (S.Set (Client Integer))
classifyClients1 clients = foldr (put_client_in_map) classified clients
         where classified = M.fromList [(GovOrgKind, S.empty)
                                       ,(CompanyKind, S.empty)
                                       ,(IndividualKind, S.empty)]
                

-- s.insert g S.    
put_client_in_map :: Client Integer -> M.Map ClientKind (S.Set (Client Integer)) -> M.Map ClientKind (S.Set (Client Integer))
put_client_in_map g@(GovOrg {..}) m = M.alter (\(Just v) -> Just (S.insert g v)) GovOrgKind m
put_client_in_map c@(Company {..}) m =  M.alter (\(Just v) -> Just (S.insert c v)) CompanyKind m
put_client_in_map i@(Individual {..}) m = M.alter (\(Just v) -> Just (S.insert i v)) IndividualKind m


testGov = GovOrg 12323 "fdfdfdfd"
testCompany = Company 232323 "dfdfdfd" (Person "dfdfd" "fdfdfd") "fdfdfdf"
testIndividual = Individual 3343 (Person "drfdfdf" "dfdfdf")

testData = [testGov, testCompany, testIndividual]


--Teh second should first create lists corresponding to the three different kinds and at the end
--convert these to sets and generate the mentioned map from them 