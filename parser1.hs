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



instance Functor Parser where
    --fmap (a -> b) -> f a -> fb
    fmap g p = P (\inp -> case parse p inp of
                            [] -> []
                            [(v,out)] -> [(g v,out)])

--main = do
        --a  <- getLine
        --return (parse item) <*> getLine >>= putStrLn . fst . head

--just for my convenience
--charToString :: Char -> String
--charToString c = [c]