
import System.Random



type RandomState a = State StdGen a

getRandom :: Random a => RandomState a
getRandom = get >>= \gen ->
    let (val, gen') = random gen in
        put gen' >>
        return val


-- function for getting a pair of ranom numbers using the above
getTwoRandoms :: Random a => RandomState (a,a)
getTwoRandoms = liftM2 (,) getRandom getRandom



---random peace of code
-- main :: IO ()
-- main = do
--     num <- rand
--     putStrLn (show num)


-- rand :: IO Int
-- rand = getStdRandom (randomR (0, maxBound))
