--subsets (all possible combinations of excluding or including each
--element of in the list )
subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = yss ++ map (x:) yss
              where yss = subs xs

--all possible ways of inserting a new element into a list
interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

--permutations (all possible reorderings of a list)
perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concat (map (interleave x ) (perms xs))

first' :: [a] -> [a]
first' (y:ys) = [y]