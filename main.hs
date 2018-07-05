sayHello :: IO String
sayHello = do
    name <- getLine
    putStrLn ("hello " ++ name)
    return name




beCarefull :: Maybe Int
beCarefull = do
    Just 5
    Nothing
    return 5
