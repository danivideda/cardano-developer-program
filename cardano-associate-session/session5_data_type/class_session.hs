data IntList
    = Empty
    | Cons Int IntList
    deriving (Show)

intListProduct :: IntList -> Int
intListProduct Empty = 1
intListProduct (Cons head list) = head * intListProduct list

-- Cons 5 (Cons 2 (Cons 3 Empty))

intListProductx :: [Int] -> Int
intListProductx [] = 0
intListProductx (x : xs) = x * product xs

data Tree
    = Leaf Int
    | Node Tree Int Tree
    deriving (Show)

dummyTree :: Tree
dummyTree = Node (Leaf 2) 1 (Node (Leaf 4) 3 (Leaf 5))

findInTree :: Int -> Tree -> Bool
findInTree i (Leaf j) = i == j
findInTree i (Node left j right) = i == j || findInTree i left || findInTree i right

-- LOG MESSAGE
data MessageType
    = Info
    | Warning
    | Error Int
    deriving (Show, Eq)

type TimeStamp = Int

data LogMessage
    = LogMessage MessageType TimeStamp String
    | Unknown String
    deriving (Show, Eq)

parseLog :: String -> LogMessage
parseLog logContents = case (words logContents) of
    "I" : timeStamp : stringMessage ->
        LogMessage Info (read timeStamp) (unwords stringMessage)
    "W" : timeStamp : stringMessage ->
        LogMessage Warning (read timeStamp) (unwords stringMessage)
    "E" : errorCode : timeStamp : stringMessage ->
        let arg1 = Error (read errorCode)
            arg2 = read timeStamp
            arg3 = unwords stringMessage
         in LogMessage arg1 arg2 arg3
    stringMessage ->
        Unknown (unwords stringMessage)

exCase = case "Hello" of
    [] -> 3
    ('H' : s) -> length s
    _ -> 7