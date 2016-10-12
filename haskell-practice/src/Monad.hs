module Monad (showResult) where

import Control.Monad.State

add1 :: State Int ()
add1 = do
    n <- get
    put (n + 1)

showResult :: IO ()
showResult = print $ execState add1 0