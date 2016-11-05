module Main where

import UseReaderMonad

main :: IO ()
main = do
  print $ runReaderMonad mapReaderMonad 3
  return ()
