isiBind :: (Monad m, Num b) => m b -> m b -> m b
isiBind x y = x >>= \a -> y >>= \b -> return (a + b)

main :: IO ()
main = do
    text <- readFile "original.txt"
    appendFile "copy.txt" (text ++ "\n")
    writeFile "copyOW.txt" text
    print "done writing"

gabungkan :: [Int] -> String
gabungkan y = y >>= \x -> show x

-- >>> [1,2,3,4] >>= \x -> return x
-- [1,2,3,4]

-- >>> putStrLn "Wah!" >>= \x -> return x

eitherFunc1 :: String -> Either String Int
eitherFunc1 "" = Left "String cannot be empty!"
eitherFunc1 str = Right $ length str

eitherFunc2 :: Int -> Either String Float
eitherFunc2 i =
    if i `mod` 2 == 0
        then Left "Length cannot be even!"
        else Right ((fromIntegral i) * 3.14159)

eitherFunc3 :: Float -> Either String [Int]
eitherFunc3 f =
    if f > 15.0
        then Left "Float is too large!"
        else Right [floor f, ceiling f]

runEitherFuncs :: String -> Either String [Int]
runEitherFuncs input = do
    i <- eitherFunc1 input
    f <- eitherFunc2 i
    eitherFunc3 f
