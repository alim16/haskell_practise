str2action :: String -> IO ()
str2action input = putStrLn ("Data: " ++ input)

list2actions :: [String] -> [IO ()]
list2actions = map str2action

numbers :: [Int]
numbers = [1..10]

strings :: [String]
strings = map show numbers

actions :: [IO ()]
actions = list2actions strings

printitall :: IO ()
printitall = runall actions


--take list of actions and execute each of them in turn
runall :: [IO ()] -> IO ()
runall [] = return ()
runall (x:xs) = do x
                   runall xs

--main = do str2action "start of the program"
--          printitall
--          str2action "done!"

--turns an ordinary function of two arguments f into a function over multiple values (lists)
mvLift2 :: (a -> b -> c) -> [a] -> [b] -> [c]
mvLift2 f x y = do x' <- x
                   y' <- y
                   return (f x' y')