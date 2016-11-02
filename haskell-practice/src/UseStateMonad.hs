module UseStateMonad (showResult) where

import Control.Monad.State

add1 :: State Int ()
add1 = do
    n <- get
    put (n + 1)

add2 = do
    n <- get
    put (n + 2)

showResult :: IO ()
showResult = print $ execState add1 0

