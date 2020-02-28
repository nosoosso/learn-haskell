module LEither where

-- left-bias Either
data Either'' b a = Right'' b | Left'' a
    deriving (Eq, Ord, Read, Show)
instance Functor (Either'' a) where
  fmap f (Left'' x) = Left'' $ f x
  fmap _ (Right'' x) = Right'' x