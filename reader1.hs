module R1 where
import Control.Monad.Reader

data Conf = Conf {
    conf1::[Char]
}

firstConf = Conf {conf1="test1"}

main :: IO ()
main = putStrLn $ runReader showConf firstConf

showConf :: Reader Conf String
showConf = do
    conf <- ask
    return $ "config is: " ++ (conf1 conf)