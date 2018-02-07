module IntroductionToHaskell.UseST where

import Control.Monad.ST (runST)
import Control.Monad (forM_)
import Data.STRef (newSTRef, modifySTRef, readSTRef)

procCount :: Integer
procCount = runST $ do
    n <- newSTRef 0
    m <- newSTRef "aaa"

    forM_[1..10] $ \i -> do
        modifySTRef n (+ i)

    n2 <- readSTRef n
    readSTRef m

    readSTRef n