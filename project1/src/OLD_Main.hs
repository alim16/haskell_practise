module Main where

import System.IO (readFile)
import Data.Time (getCurrentTime)
-- import Data.Aeson (decode)
-- import Data.Sequence as Seq

main :: IO ()
main = do
  putStrLn "hello world"
  printTime


printConfig = do
  contents <- readFile "stack.yaml"
  putStrLn contents


printTime = do
    time <- getCurrentTime
    putStrLn (show time)

-- json = do
--   js <- encode (Seq.fromList [1,2,3,4])
--   print js

beCareful :: Maybe Int
beCareful = do
  Just 6
  Nothing
  return 5


sayHello :: IO String
sayHello = do
  name <- getLine
  putStrLn ("Hello+2" ++ name)
  return name