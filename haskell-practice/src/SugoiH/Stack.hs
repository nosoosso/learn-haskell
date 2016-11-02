-- | すごいHaskell 第14章 Stateモナド
module Stack where

import Control.Monad.State

type Stack = [Int]

pop :: State Stack Int
pop = state $ \(x:xs) -> (x, xs)

push :: Int -> State Stack ()
push a = state $ \xs -> ((), a:xs)

-- | スタックに3をpushした後2回popする
stackManip :: State Stack Int
stackManip = do
  push 3
  pop
  pop

-- | stackManipと同じことをdo式を使わずにやる
stackManip' :: State Stack Int
stackManip' = push 3 >> pop >> pop

-- | スタックに1, 2, 3を順番にpushする
push123 :: State Stack ()
push123 = do
  push 1
  push 2
  push 3

-- | 2回popして、popした2つの値を合計して取得する
popop :: State Stack Int
popop = do
  a <- pop
  b <- pop
  return $ a + b

run :: IO ()
run = do
  let stack = [1,2,3,4,5,6]
  print $ runState stackManip stack
  print $ runState stackManip' stack
  print $ runState push123 stack
  print $ runState popop stack
  -- output:
  -- (1,[2,3,4,5,6])
  -- (1,[2,3,4,5,6])
  -- ((),[3,2,1,1,2,3,4,5,6])
  -- (3,[3,4,5,6])
