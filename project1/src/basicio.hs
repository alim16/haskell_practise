main = do
    putStrLn "greetings what is your name"
    inputStr <- getLine
    putStrLn $ "welcome " ++ inputStr ++ "!"

