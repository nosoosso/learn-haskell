module Lib
    ( Either'(..)
    ) where

data Either' a b = Left' a | Right' b

-- instance Functor (Either' a) where
--   fmap f (Left' x) = f x
--   fmap f (Right' x) = Right' x
