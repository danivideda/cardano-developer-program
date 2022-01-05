--LOG PARSING CODE
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

data MessageTree
    = Leaf
    | Node MessageTree LogMessage MessageTree
    deriving (Show, Eq)

parseLog :: String -> [LogMessage]
parseLog rawContents = map parseSingleLog (lines rawContents)

parseSingleLog :: String -> LogMessage
parseSingleLog str = case words str of
    "I" : timestamp : wordsInLog -> makeLog Info timestamp wordsInLog
    "W" : timestamp : wordsInLog -> makeLog Warning timestamp wordsInLog
    "E" : errorSeverity : timestamp : wordsInLog ->
        makeLog
            (Error (read errorSeverity))
            timestamp
            wordsInLog
    _ -> Unknown str

makeLog :: MessageType -> String -> [String] -> LogMessage
makeLog msgType timestamp wordsIntLog =
    LogMessage
        msgType
        (read timestamp)
        (unwords wordsIntLog)

insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert log@(LogMessage _ _ _) Leaf = Node Leaf log Leaf
insert log@(LogMessage _ timestamp _) (Node left logInsideNode@(LogMessage _ timestampTree _) right)
    | timestamp < timestampTree = Node (insert log left) logInsideNode right
    | otherwise = Node left logInsideNode (insert log right)

-- convert list of logs to a ordered message tree (order by timestamp)
build :: [LogMessage] -> MessageTree
build [] = Leaf
build (log : logs) = insert log (build logs)

inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left root right) = (inOrder left) ++ [root] ++ (inOrder right)

--remove all unknown logs
sortedLogs :: [LogMessage] -> [LogMessage]
sortedLogs logs = inOrder (build logs)

whatWentWrong :: [LogMessage] -> [String]
whatWentWrong logs = whatWentWrongHelper (sortedLogs logs)

-- assume that log are sorted
whatWentWrongHelper :: [LogMessage] -> [String]
whatWentWrongHelper logs = map getMEssageFromLog (filter isCriticalLog logs)

isCriticalLog :: LogMessage -> Bool
isCriticalLog (LogMessage (Error severity) _ _) = severity > 50
isCriticalLog _ = False

getMEssageFromLog :: LogMessage -> String
getMEssageFromLog (LogMessage _ _ msg) = msg
getMEssageFromLog (Unknown msg) = msg

main :: IO ()
main = do
    -- let logs = "E 200 90 read/write problem \nI 42 you are doing great\nW 89 warning harddisk almost full\nE 100 12 your disk is full\nflastjhjhskjkjsd\nE 80 10 data overflow"
    logs <- readFile "sample.log"
    let parsedLog = parseLog logs
    print (whatWentWrong parsedLog)