--{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

import Control.Lens.TH


data Task = Task
  { _taskName :: String
  , _taskExpectedMinutes :: Int
  , _taskCompleteTime :: UTCTime }

  makeLenses ''Task

data Project = Project
  { _projectName :: String
  , _projectCurrentTask :: Task
  , _projectRemainingTasks :: [Task] }

  makeLenses ‘’Project