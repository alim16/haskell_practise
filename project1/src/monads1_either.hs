
--some safe versions of known functions
sHead :: [a] -> (Either String) a
sHead [] = Left "empty list from head function"
sHead [x] = Left "not enough elements for divide function"
sHead (x:_) = Right x

sTail :: [a] -> (Either String) [a]
sTail [] =  Left "missing second number from tail function"
sTail (_:xs) = Right xs

sDiv :: (Eq a, Fractional a) => a -> a -> (Either String) a
sDiv _ 0 = Left "dividing by zero"
sDiv x y = Right (x/y)

--same function with normal bind, still works the same
divideNumbers' :: [Double] -> (Either String) Double
divideNumbers' xs = do
    sHead xs >>= \a ->
     sTail xs >>= \rest ->
        sHead rest >>= \b ->
        sDiv a b
