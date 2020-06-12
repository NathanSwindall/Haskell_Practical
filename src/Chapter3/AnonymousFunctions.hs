{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}

module Chapter3.AnonymousFunctions where 

import Chapter2.Records
import Chapter2.DataTypes


sayHello :: [String] -> [String]
sayHello names = map (\name -> case name of 
                                 "Alejandro" -> "Hello, writer"
                                 _           -> "Welcome, " ++ name
                                 ) names

--We can used a short form of the case expression if we use the LambdaCase language extension
sayHello2 names = map(\case "Alejandro" -> "Hello, writer"
                            name        -> "Welcome, " ++ name
                    ) names
    
--working with filters
filterNot pnot = filter (pnot /=)

isGovOrg GovOrgR {} = True
isGovOrg _          = False

filterGovOrgs :: [ClientR] -> [ClientR]
filterGovOrgs = filter isGovOrg

testData = GovOrgR "Korean Electric"
testData2 = GovOrgR "Korean Electric 2"
testData3 = IndividualR (PersonR "Nathan" "Swindall")

testDataList = [testData, testData2, testData3, testData3]




