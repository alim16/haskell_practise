module GameState where

import Control.Monad.State
import Control.Monad.Reader



main = print $ runState (playGame "aabcbba") initialState

type GameValue = Int
type GameState = (Bool,Int)
type T = ReaderT String (StateT GameState) GameValue

initialState = (False,0)

playGame :: String -> T
playGame [] = do
    (_,score) <- get
    return (score)

playGame (x:xs) = do
    (on,score) <- get
    case x of 
        'a' | on -> put (on, score + 1)
        'b' | on -> put (on, score - 1)
        'c'      -> put (not on, score)
        _        -> put (on, score)
    playGame xs