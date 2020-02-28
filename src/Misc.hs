module Misc where

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' :: [Int]
fib' = 1:1:zipWith (+) fib' (tail fib')

fizzbuzz :: Int -> [String]
fizzbuzz n = go n []
  where
    go :: Int -> [String] -> [String]
    go 0 list = list
    go n list
      | n `mod` 15 == 0 = go (n - 1)  ("fizzbuzz" : list)
      | n `mod` 3 == 0 = go (n - 1) ("fizz" : list)
      | n `mod` 5 == 0 = go (n - 1) ("buzz" : list)
      | otherwise = go (n - 1) (show n : list)

fizzbuzz' :: [String]
fizzbuzz'  = foldr judge [] [1..] where
  judge :: Int -> [String] -> [String]
  judge x list
    | x `mod` 15 == 0 = "fizzbuzz" : list
    | x `mod` 3 == 0 = "fizz" : list
    | x `mod` 5 == 0 = "buzz" : list
    | otherwise = show x : list

fizzbuzz2 :: [String]
fizzbuzz2 = map judge [1..] where
  judge :: Int -> String
  judge x
    | x `mod` 15 == 0 = "fizzbuzz"
    | x `mod` 3 == 0 = "fizz"
    | x `mod` 5 == 0 = "buzz"
    | otherwise = show x
