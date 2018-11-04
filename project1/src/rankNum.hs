main :: IO ()
main = putStrLn . show . fst . tupleMax . map (\x -> (x,occ x arr)) $ arr
        where arr = [1,2,5,11,11,11,11,5,5,5,1,1]

occ e = length . filter (==e)

tupleMax :: (Ord a, Ord b) => [(a,b)] -> (a,b)
tupleMax l = swap $ maximum $ map swap l
                where swap (x, y) = (y, x) 


----------other solution
highestRank :: Ord c => [c] -> c
highestRank = head . maximumBy (compare `on` length) . group . sort
