module Chapter3.PartialApp where 

--When using sections be careful 
section1 = map (/2) [1,2,3]
section2 = map (2/) [1,2,3]

cons_section = ('a':)

--special functions
--curry
--uncurry
--not curried takes one argument
--not curried takes a tuple

not_curried_max = map (uncurry max) [(1,2),(2,1),(3,4)]

--if you want to flip arguments you have the flip function