main :: IO ()
main =
    putStr "What is your name? "
        >> getLine
        >>= \a ->
            putStr "How old are you? "
                >> getLine
                >>= \b -> print (a, b)

data Person = Person {name :: String, age :: Int} deriving (Show)

kuldeep :: Person
kuldeep = Person{name = "Kuldeep", age = 24}

adithya :: Person
adithya = kuldeep{name = "Adithya"}

printName :: Person -> IO ()
printName Person{name = x} = putStrLn x