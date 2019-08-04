module Mpm where 

import Data.Char (toUpper)


main::IO ()
main = do
    x <- readFile "input.txt"
    let x2 = map toUpper x
    mapM_ putStrLn (lines x2)