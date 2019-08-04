
--some safe versions of known functions
sHead :: [a] -> Maybe a
sHead [] = Nothing
sHead (x:_) = Just x

sTail :: [a] -> Maybe [a]
sTail [] = Nothing
sTail (_:xs) = Just xs

sDiv :: (Eq a, Fractional a) => a -> a -> Maybe a
sDiv _ 0 = Nothing
sDiv x y = Just (x/y)


andThen :: (Maybe a) -> (a -> Maybe b) -> Maybe b
andThen Nothing _ = Nothing
andThen (Just x) f = f x

divideNumbers :: [Double] -> Maybe Double
divideNumbers xs = do
    sHead xs `andThen` \a ->
        sTail xs `andThen` \rest ->
            sHead rest `andThen` \b ->
             sDiv a b

--same function with normal bind, still works the same
divideNumbers' :: [Double] -> Maybe Double
divideNumbers' xs = do
    sHead xs >>= \a ->
     sTail xs >>= \rest ->
        sHead rest >>= \b ->
        sDiv a b
