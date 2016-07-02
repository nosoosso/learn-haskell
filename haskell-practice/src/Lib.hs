module Lib where

-- right-bias Either
data Either' a b = Left' a | Right' b deriving (Eq, Ord, Read, Show)
instance Functor (Either' a) where
  fmap _ (Left' x) = Left' x
  fmap f (Right' x) = Right' $ f x

-- left-bias Either
data Either'' b a = Right'' b | Left'' a  deriving (Eq, Ord, Read, Show)
instance Functor (Either'' a) where
  fmap f (Left'' x) = Left'' $ f x
  fmap _ (Right'' x) = Right'' x

-- s = show $ Left' 3
--
-- r :: IO ()
-- r = do
--   return $ show $ Left' 3
--   -- print (Right' 3)
--   print $ fmap (+ 1) (Left' 3)
--   -- print $ fmap (+ 1) (Right' 3)
--   -- print $ fmap (+ 1) (Left'' 3)
--   print $ fmap (+ 1) (Right'' 3)
--   return ()
