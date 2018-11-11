module Parser1 where

import Data.Char
import Control.Applicative


newtype Parser a = P (String -> [(a,String)])


parse :: Parser a -> String -> [(a,String)]
parse (P p) inp = p inp

item :: Parser Char
item = P (\inp -> case inp of
                    []     -> []
                    (x:xs) -> [(x,xs)])





--main = do
        --a  <- getLine
        --return (parse item) <*> getLine >>= putStrLn . snd . head