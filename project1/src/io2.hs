module Io2 where

import Control.Applicative
import Control.Monad

main::IO()
main = do
    putStrLn "hello: enter a line"
    s <- getLine
    putStrLn . showLength $ Just s

showLength:: Maybe String -> String
showLength (Just (x:xs)) = show . length $ x:xs
showLength _ = show "no string given"