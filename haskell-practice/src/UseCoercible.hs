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
  print boxs -- [Box {unwrap = 1},Box {unwrap = 2},Box {unwrap = 3},Box {unwrap = 4},Box {unwrap = 5}]
  print $ toInts boxs -- [1,2,3,4,5]

  let boxs2 = (coerce :: [Int] -> [Box]) [6,7,8,9,10]
  print boxs2 -- [Box {unwrap = 6},Box {unwrap = 7},Box {unwrap = 8},Box {unwrap = 9},Box {unwrap = 10}]
  print $ (coerce :: [Box] -> [Int]) boxs2 -- [6,7,8,9,10]
