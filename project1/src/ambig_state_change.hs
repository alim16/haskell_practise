#!/usr/bin/env stack
-- stack --resolver lts-8.12 script
import Control.Concurrent.Async.Lifted
import Control.Monad.State.Strict


--result of this is not always deterministic
-- https://www.fpcomplete.com/blog/2017/06/readert-design-pattern
main :: IO ()
main = execStateT
    (concurrently (modify (+ 1)) (modify (+ 2)))
    4 >>= print