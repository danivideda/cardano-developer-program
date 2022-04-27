-- import Control.Monad.Reader (Reader, ask, runReader)

-- tom :: Reader String String
-- tom = do
--     env <- ask
--     return (env ++ " This is Tom.")

-- jerry :: Reader String String
-- jerry = do
--     env <- ask
--     return (env ++ " This is Jerry.")

-- tomAndJerry :: Reader String String
-- tomAndJerry = do
--     t <- tom
--     j <- jerry
--     return (t ++ "\n" ++ j)

-- runJerryRun :: String
-- runJerryRun = runReader tomAndJerry "Ay yo?"

-- runJerryRun' :: IO ()
-- runJerryRun' = putStrLn $ runReader tomAndJerry "Who is this?"

-- ---------------------------------------------
-- import Control.Monad (liftM, liftM2)

-- plus :: [Int] -> [Int] -> [Int]
-- plus = liftM2 (+)

-- plus1 :: [Int] -> [Int]
-- plus1 = liftM (+ 1)

-- plusfMAP :: [Int] -> [Int]
-- plusfMAP = fmap (+ 1)

-- -------------------------------------------------------

import Control.Monad.Trans.Class
import Control.Monad.Trans.State.Lazy (StateT (runStateT), get, modify, put)

stateTExample :: StateT Int IO (Int, Int, Int)
stateTExample = do
    a <- get
    lift $ print "Initial value:"
    lift $ print a
    modify (+ 1)
    b <- get
    lift $ putStrLn "After adding 1:"
    lift $ print b
    put 5
    c <- get
    lift $ putStrLn "After setting as 5:"
    lift $ print c
    return (a, b, c)

main :: IO ()
main = do
    putStrLn "Please enter a number."
    input <- read <$> getLine
    results <- runStateT stateTExample input
    print results

-- ----------------------------------------------

-- import Control.Monad.IO.Class (liftIO)
-- import Control.Monad.Trans.State (StateT, evalStateT, get, runStateT)

-- printState :: Show s => StateT s IO ()
-- printState = do
--     state <- get
--     liftIO $ print state

-- -----------------------------

-- import Control.Monad.Trans.State.Lazy (StateT (runStateT), execStateT, get, modify, put)

-- -- import System.Random
-- import Control.Monad.Trans.Class (MonadTrans (lift))

-- ------------------------------------------------------
-- data MaybeIO a = MaybeIO {unMaybeIO :: IO (Maybe a)}

-- instance Functor MaybeIO where
--     fmap f action = do
--         result <- action
--         return $ f result

-- instance Monad MaybeIO where
--     return = MaybeIO . return . Just
--     MaybeIO ioa >>= f = MaybeIO $ do
--         ma <- ioa
--         case ma of
--             Nothing -> return Nothing
--             Just a -> unMaybeIO $ f a