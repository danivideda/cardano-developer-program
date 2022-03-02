import Data.Char (isDigit)

-- pake IO Maybe biasa
readInt :: IO (Maybe Int)
readInt = do
    s <- getLine
    if all isDigit s
        then return $ Just (read s)
        else return Nothing

addThree :: IO (Maybe Int)
addThree = do
    mi <- readInt
    mj <- readInt
    mk <- readInt
    case (mi, mj, mk) of
        (Just i, Just j, Just k) -> return $ Just (i + j + k)
        _ -> return Nothing

addThree' :: IO (Maybe Int)
addThree' = do
    mi <- readInt
    mj <- readInt
    mk <- readInt
    return $ do
        i <- mi
        j <- mj
        k <- mk
        return $ i + j + k