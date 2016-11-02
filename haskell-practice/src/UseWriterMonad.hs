module UseWriterMonad (
  showWriterResult
    ) where

import Control.Monad.Writer

writeCount :: String -> Writer (Sum Int) String
writeCount message = writer(message, 1)

log3Times :: String -> Writer (Sum Int) String
log3Times initialMessage = do
  return initialMessage
  a <- writeCount "log2"
  b <- writeCount "log3"
  return b


showWriterResult :: (String, Sum Int)
showWriterResult = runWriter $ log3Times "log1"
