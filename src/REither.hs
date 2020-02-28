module REither where

-- right-bias Either
data REither a b = RLeft a | RRight b 
    deriving (Eq, Ord, Read)

instance (Show a, Show b) => Show (REither a b) where
    show (RLeft l) = show l
    show (RRight r) = show r

instance Functor (REither a) where
  fmap _ (RLeft x) = RLeft x
  fmap f (RRight x) = RRight $ f x

ok :: Integer
ok = getIfRight (RRight 4) 0

notOk :: Integer
notOk = getIfRight (RLeft 4) 0

getIfRight :: REither a b -> b -> b
getIfRight (RRight r) _ = r
getIfRight _ defaultVal = defaultVal

left :: REither Int b
left = RLeft 3

right :: REither a Int
right = RRight 4

-- r :: IO ()
-- r = do
--   return $ show $ RLeft 3
--   -- print (RRight 3)
--   print $ fmap (+ 1) (RLeft 3)
--   -- print $ fmap (+ 1) (RRight 3)
--   -- print $ fmap (+ 1) (RLeft 3)
--   print $ fmap (+ 1) (RRight 3)
--   return ()


-- useRRight :: IO ()
-- useRRight = do
--   putStr $ show $ fmap (+1) RRight 3
--   putStr $ show $ fmap (+1) RRight 3
--   return ()