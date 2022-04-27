main :: IO ()
main = addList []

addList :: [String] -> IO ()
addList oldValue = do
    putStrLn "\na> Add New List d> Done"
    pilihanMenu <- getLine
    case pilihanMenu of
        "a" -> do
            putStr "Insert new value: "
            newValue <- getLine
            let newValueList = oldValue ++ [newValue]
            print newValueList
            addList newValueList
        "d" -> print oldValue
        _ -> do
            putStrLn "Please chose first letter from the menu!"
            print oldValue
            addList oldValue