{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}

module ExistentiallyQuantifiedTypes where

-- https://en.wikibooks.org/wiki/Haskell/Existentially_quantified_types

data ShowBox = forall s. Show s => SB s

instance Show ShowBox where
    show (SB s) = show s

heteroList :: [ShowBox]
heteroList = [SB (), SB 5, SB True]

f :: [ShowBox] -> IO ()
f xs = mapM_ print xs

data T = forall a. MkT a
data T' = forall a. Show a => MkT' a

heteroList' = [MkT' 5, MkT' (), MkT' True, MkT' "Sartre"]
showHeteroList' = mapM_ (\(MkT' x ) -> print x) heteroList'

newtype Pair a b = Pair (forall c. (a -> b -> c) -> c)
makePair :: a -> b -> Pair a b
makePair a b = Pair $ \f -> f a b