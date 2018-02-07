module IntroductionToHaskell.UseReader where

import Control.Monad.Trans.Reader(Reader, runReader, asks, local)

data PowerEnv = PowerEnv { 
    powEnergy :: !Double
    , powSaveMode :: !Bool
}

consume :: Reader PowerEnv Double
consume = do
    energy <- asks powEnergy
    savemode <- asks powSaveMode
    let
        consumption = if savemode 
            then 
                energy / 10.0
            else
                energy
    return consumption


run = runReader consume $ PowerEnv 10.0 True
