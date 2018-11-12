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
    --fmap :: (a -> b) -> f a -> fb
    fmap g p = P (\inp -> case parse p inp of
                            [] -> []
                            [(v,out)] -> [(g v,out)])

instance Applicative Parser where
    --pure :: a -> Parser a
    pure v = P (\inp -> [(v,inp)])

    -- <*> :: Parser (a -> b) -> Parser a -> Parser b
    pg <*> px = P (\inp -> case parse pg inp of
                                [] -> []
                                [(g,out)] -> parse (fmap g px) out)

instance Monad Parser where
    -- >>= :: Parser a -> (a -> Parser b) -> Parser b
    p >>= f = P (\inp -> case parse p inp of
        [] -> []
        [(v,out)] -> parse (f v) out)

threeM :: Parser (Char,Char)
threeM = do
        x <- item
        item
        z <- item
        return (x,z)


three:: Parser (Char,Char)
three = pure g <*> item <*> item <*> item
        where g x y z = (x,z) 




--main = do
        --a  <- getLine
        --return (parse item) <*> getLine >>= putStrLn . fst . head

--just for my convenience
--charToString :: Char -> String
--charToString c = [c]