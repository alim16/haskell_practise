

todoList :: [IO ()]
todoList = [ putChar 'a',
            do putChar 'b'
               putChar 'c',
            do c <- getChar
               putChar c]


sequence2_ :: [IO ()] -> IO ()
sequence2_ = foldr (>>) (return ())

putStr2 :: String -> IO ()
putStr2 s = sequence2_ (map putChar s)

main = do 
    putStr2 "nothing new"
    putStrLn ""
    pu