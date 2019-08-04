module Parser_math where


import Parser_basics
import Control.Applicative (many,some,(<|>))
import Data.Char (isSpace)

--variable names (lowercase letter followed by zero or more alphas)
ident :: Parser String
ident = do x <- lower
           xs <- many alphaNum
           return (x:xs)

--natural numbers
nat :: Parser Int
nat = do xs <- some digit
         return (read xs)

--removes zero or more spaces/tabs before string
space :: Parser ()
space = do many (sat isSpace)
           return ()
--integers
int :: Parser Int
int = do char '-'
         n <- nat
         return (-n)
        <|> nat

-- ========================

token :: Parser a -> Parser a
token p = do space
             v <- p
             space
             return v

natural :: Parser Int
natural = token nat

integer :: Parser Int
integer = token int

symbol :: String -> Parser String
symbol xs = token (string xs)


-- ===============example for parsing a string of natural numbers
nats :: Parser [Int]
nats = do symbol "["
          n <- natural
          ns <- many (do symbol ","
                         natural)
          symbol "]"
          return (n:ns)

-- ============math expression parser

--grammar: (using [] as greek epsilon character)
  --expr ::- term (+ expression | [] )
  --term ::- factor ( * term | [] )
  --factor ::- ( expr ) | nat
  --nat ::- 1 | 2 | 3 ...


expr :: Parser Int
expr = do t <- term
          do symbol "+"
             e <- expr
             return (t + e)
           <|> return t

term :: Parser Int
term = do f <- factor
          do symbol "*"
             t <- term
             return (f * t)
           <|> return f

factor :: Parser Int
factor = do symbol "("
            e <- expr
            symbol ")"
            return e
          <|> nat

eval :: String -> Int
eval input = case (parse expr input) of
                [(n,[])] -> n
                [(_,out)] -> error ("unparsed input: " ++ out)
                [] -> error "invalid input"