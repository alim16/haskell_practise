module Parser_basics where

import Data.Char
import Control.Applicative


newtype Parser a = P (String -> [(a,String)])


parse :: Parser a -> String -> [(a,String)]
parse (P p) inp = p inp

item :: Parser Char
item = P (\inp -> case inp of
                    []     -> []
                    (x:xs) -> [(x,xs)])

sat :: (Char -> Bool) -> Parser Char
sat p = do x <- item
           if p x then return x else empty

digit :: Parser Char
digit = sat isDigit

letter :: Parser Char
letter = sat isAlpha

char :: Char -> Parser Char
char x = sat (== x)


upper :: Parser Char
upper = sat isUpper

lower :: Parser Char
lower = sat isLower

alphaNum :: Parser Char
alphaNum= sat isAlphaNum

string :: String -> Parser String
string [] = return []
string (x:xs) = do  char x
                    string xs
                    return (x:xs)



instance Functor Parser where
    --fmap :: (a -> b) -> f a -> fb
    fmap g p = P (\inp -> case parse p inp of
                            []        -> []
                            [(v,out)] -> [(g v,out)])

instance Applicative Parser where
    --pure :: a -> Parser a
    pure v = P (\inp -> [(v,inp)])

    -- <*> :: Parser (a -> b) -> Parser a -> Parser b
    pg <*> px = P (\inp -> case parse pg inp of
                                []        -> []
                                [(g,out)] -> parse (fmap g px) out)

instance Monad Parser where
    -- >>= :: Parser a -> (a -> Parser b) -> Parser b
    p >>= f = P (\inp -> case parse p inp of
                            []        -> []
                            [(v,out)] -> parse (f v) out)

instance Alternative Parser where
    -- empty :: a -> Parser a
    empty = P (\x -> [])

    -- <|> :: Parser a -> Parser a -> Parser a
    p <|> q = P (\inp -> case parse p inp of
                            []        -> parse q inp
                            [(v,out)] -> [(v,out)])




-- ================================================================================ --
threeM :: Parser (Char,Char)
threeM = do
        x <- item
        item
        z <- item
        return (x,z)


three:: Parser (Char,Char)
three = pure g <*> item <*> item <*> item
        where g x y z = (x,z) 


or1 :: Parser Char
or1  = do 
        x <- P (parse (empty <|> item))
        return x
        

--main = do
        --a  <- getLine
        --return (parse item) <*> getLine >>= putStrLn . fst . head

--just for my convenience
--charToString :: Char -> String
--charToString c = [c]