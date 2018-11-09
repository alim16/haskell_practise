module Mpm where 

import Control.Monad

main::IO ()
main = do
    x <- readFile "input.txt"
    mapM_ putStrLn (lines x)