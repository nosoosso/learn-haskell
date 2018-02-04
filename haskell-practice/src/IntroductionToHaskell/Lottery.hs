{- |
Description 書籍「Haskell入門」5.1.3 に登場するゲームのくじ引きバージョン
-}
module IntroductionToHaskell.Lottery where

import Control.Monad.Trans.State
import System.Random.Shuffle (shuffleM)

data Lot = Win | Lose deriving (Show)
type Lots = [Lot]
type LotteryBox = Lots
type Result = Lots

drawLots :: Int -> State LotteryBox Result
drawLots n = do
    lots <- get
    put $ drop n lots
    return $ take n lots

-- 10回引く
draw10Times :: State LotteryBox Result
draw10Times = drawLots 10

generateLotteryBox :: IO LotteryBox
generateLotteryBox = 
    let
        win = take 30 $ repeat Win
        lose = take 70 $ repeat Lose
        unshuffled = win ++ lose
    in
        shuffleM unshuffled

runGame :: IO ()
runGame = do
    box <- generateLotteryBox

    let (result, rest) = runState draw10Times box
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Rest in box: " ++ show rest

    putStrLn $ "All Win count: " ++ (show $ countWin result + countWin rest)
    putStrLn $ "All Lose count: " ++ (show $ countLose result + countLose rest)

    where
        isWin :: Lot -> Bool
        isWin Win = True
        isWin Lose = False

        isLose :: Lot -> Bool
        isLose = not . isWin

        count :: (a -> Bool) -> [a] -> Int
        count p xs = foldr (\x acc -> if p x then acc + 1 else acc) 0 xs

        countWin :: Lots -> Int
        countWin lots = count isWin lots

        countLose :: Lots -> Int
        countLose lots = count isLose lots
