
module Average where

import Data.List (transpose)

    
  
{-
Create a function that takes a 2D array as an input, and outputs another array that contains the average values for 
the numbers in the nested arrays at the corresponding indexes.
Note: the function should also work with negative numbers and floats.

[ [1, 2, 3, 4], [5, 6, 7, 8] ]  ==>  [3, 4, 5, 6]

1st array: [1, 2, 3, 4]
2nd array: [5, 6, 7, 8]
            |  |  |  |
            v  v  v  v
average:   [3, 4, 5, 6]

-}

avgArray :: Integral a => [[a]] -> [Double]
avgArray =  map ( av1) . transpose
      where av1 :: Integral a => [a] -> Double
            av1 a =  ( /  (fromIntegral $ length a)) . (foldl (+) 0) . map fromIntegral $ a


--random person's solution
{-
import Data.List (transpose)

avgArray :: [[Int]] -> [Double]
avgArray = map ((/) <$> fromIntegral . sum <*> fromIntegral . length) . transpose
-}