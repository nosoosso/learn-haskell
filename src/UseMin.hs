module UseMin where

import           Data.Semigroup

one = Min 1
two = Min 2

run :: IO ()
run = do
  -- Semigroup
  print $ one <> two                 -- Min {getMin = 1}
  print $ two <> one                 -- Min {getMin = 1}
  -- Functor
  print $ fmap (* 3) two             -- Min {getMin = 6}
  -- Applicative
  print $ (+) <$> one <*> two        -- Min {getMin = 3}
  -- Monad
  print $ one >>= return . (+ 10)    -- Min {getMin = 11}
  print $ one >> two                 -- Min {getMin = 2}
  print $ do                         -- Min {getMin = 101}
    a <- one
    two
    b <- return (a + 100)
    return  b
