module Main where

import UseWriterMonad

main :: IO ()
main = do
  print $ showWriterResult
  return ()
