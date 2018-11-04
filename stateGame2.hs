module GameState where

import Control.Monad.State



main = $ runState (playGame "aabcbba") initialState

type GameValue = Int
type GameState = (Bool,Int)

initialState = (False,0)

playGame :: String -> State GameState GameValue
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