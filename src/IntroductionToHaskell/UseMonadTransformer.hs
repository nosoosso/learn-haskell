module IntroductionToHaskell.UseMonadTransformer where

import Control.Monad (unless)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Reader (ReaderT, asks)
import Control.Monad.Trans.State (StateT, evalStateT, get, modify)
import Control.Monad.Trans.Except (ExceptT,runExceptT, throwE)


data Env = Env { envX :: !Integer, envY :: !Integer }

sumEnv :: ReaderT Env IO Integer
sumEnv = do
    x <- asks envX
    y <- asks envY
    return (x + y)

sumEnvIO :: ReaderT Env IO Integer
sumEnvIO = do
    x <- asks envX
    lift $ putStrLn ("x=" ++ show x)
    y <- asks envY
    lift $ putStrLn ("y=" ++ show y)
    return (x + y)


runExceptStateIO :: IO ()
runExceptStateIO = do
    result <- flip evalStateT 0 $ runExceptT $ loop
    case result of
        Right _ -> return ()
        Left e -> putStrLn e

    where
        loop :: ExceptT String (StateT Int IO) ()
        loop = do
            i <- st $ get
            unless (i < (3 :: Int)) $ throwE "Too much failure"

            op <- io $ getLine
            if op == "end" then
                return ()
            else do
                st $ modify (+ 1)
                loop

        io = lift . lift
        st = lift

