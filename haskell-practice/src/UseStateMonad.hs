module UseStateMonad (showResult) where

import Control.Monad.State

add :: Int -> State Int Int
add n = do
    prev <- get
    let result = prev + n
    state $ \s -> (result, result)

sub :: Int -> State Int Int
sub n = do
    prev <- get
    let result = prev - n
    state $ \s -> (result, result)

mul :: Int -> State Int Int
mul n = do
    prev <- get
    let result = prev * n
    state $ \s -> (result, result)

complicatedCalc :: State Int Int
complicatedCalc = do
    add 2
    mul 2
    sub 3

showResult :: IO ()
showResult = print $ runState complicatedCalc 1
