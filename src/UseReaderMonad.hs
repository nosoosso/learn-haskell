module UseReaderMonad (
  mapReaderMonad,
  runReaderMonad,
) where

import Control.Monad.Reader

mapReaderMonad :: Reader Int  Int
mapReaderMonad = fmap (+ 1) (return 2)

runReaderMonad :: Reader a b -> a -> b
runReaderMonad = runReader
