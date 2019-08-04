import System.Environment (getEnv)

data Config = Config
  { cfgHost :: String
  , cfgPort :: Int
  , cfgDebug :: Bool
  } deriving (Show)
readConfig :: IO Config
readConfig = Config <$> getHost 
                    <*> getPort 
                    <*> getDebug 
getHost :: IO String
getHost = getEnv "HOST"
getPort :: IO Int
getPort = read <$> getEnv "PORT"
getDebug :: IO Bool
getDebug = read <$> getEnv "DEBUG"



main =  readConfig >>= putStrLn . show