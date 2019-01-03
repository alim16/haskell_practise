import Data.List

count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x ) (rmdups xs)


result :: Ord a => [a] -> [(Int,a)]
result xs = sort [(count x xs,x) | x <- rmdups xs]


-- ====== ballots as list of lists

ballots :: [[String]]
ballots = [["Red", "Green"],
           ["Blue"],
           ["Green","Red","Blue"],
           ["Blue","Green", "Red"],
           ["Green"]] 

rmempty :: Eq a => [[a]] -> [[a]]
rmempty xs = filter (/= []) xs

elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map (filter (/= x))

rank :: Ord a => [[a]] -> [a]
rank = map snd . result . map head

winner' :: Ord a => [[a]] -> a
winner' bs = case rank (rmempty bs) of
                [c] -> c
                (c:cs) -> winner' (elim c bs)