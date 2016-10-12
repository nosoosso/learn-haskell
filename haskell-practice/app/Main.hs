module Main where

import qualified Lib 

main :: IO ()
main = do
  print Lib.ok
  print Lib.notOk
  return ()