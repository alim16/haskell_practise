import Control.Monad.Writer
import Control.Monad.Reader


------------------Writer monad example
half :: Int -> Writer String Int
half x = do
        tell ("I just halved " ++ (show x) ++ "!")
        return (x `div` 2)

quarter :: Int -> (Int,String)
quarter x = runWriter $ half x >>= half 


------------------Reader Monad example
greeter :: Reader String String
greeter = do
        name <- ask
        return ("hello, " ++ name ++ "!")





------------------State Monad example (state monad is combination of both reader and writer)
