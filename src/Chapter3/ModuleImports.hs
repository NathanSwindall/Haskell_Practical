module Chapter3.ModuleImports where 

import Data.List 
-- import Data.List (permutations, subsequence)

permutationsStartingWith :: Char -> String -> [String]
permutationsStartingWith letter 
      = filter( \l -> head l == letter). permutations

--qualified imports make it so you have to prefix the functions



