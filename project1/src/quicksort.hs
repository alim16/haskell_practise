quicksort::(Ord a) => [a] ->[a]
quicksort [] = []
quicksort (x:xs) = smallerSort ++ [x] ++ biggerSort
                where biggerSort = quicksort [a | a <- xs, a > x]
                      smallerSort = quicksort [a | a <- xs, a <= x]

randomFunctions:: a -> a
randomFunctions = unwords . reverse . words      

main = do
      line <- getLine
      --putStrLn $ quicksort line
      print $ randomFunctions line
