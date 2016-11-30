module UseCoercible where

import Data.Coerce

newtype Box = Box {unwrap :: Int} deriving (Show)

toBoxs :: [Int] -> [Box]
toBoxs = coerce

toInts :: [Box] -> [Int]
toInts = coerce

run :: IO ()
run = do
  let boxs = toBoxs [1,2,3,4,5]
  print boxs
  print $ toInts boxs

  let boxs2 = (coerce :: [Int] -> [Box]) [6,7,8,9,10]
  print boxs2
  print $ (coerce :: [Box] -> [Int]) boxs2
