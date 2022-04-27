import System.IO (hFlush, stdout)

main :: IO ()
main = addList []

data Murid = Murid
    { name :: String
    , className :: String
    , grade :: Int
    }
    deriving (Show)

prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine

addList :: [Murid] -> IO ()
addList oldValue = do
    putStrLn "\n(a) Tambah Murid (b) Cetak List Murid (q) Keluar"
    choice <- getLine
    case choice of
        "a" -> do
            nama <- prompt "Nama: "
            kelas <- prompt "Kelas: "
            nilai <- prompt "Nilai: "
            let newValueList =
                    oldValue
                        ++ [ Murid
                                { name = nama
                                , className = kelas
                                , grade = read nilai :: Int
                                }
                           ]
            print newValueList
            addList newValueList
        "b" -> do
            let width = 60
                columnWidth = width `div` 5
                line = replicate width '-'
                title1 = "No."
                title2 = "Nama"
                title3 = "Kelas"
                title4 = "Nilai"
                title5 = "Lulus"
                createColumn :: String -> String
                createColumn title = replicate spaces ' ' ++ title ++ replicate spaces ' '
                  where
                    spaces = (columnWidth - length title) `div` 2
                createList :: [Murid] -> Int -> IO ()
                createList [] no = putStr ""
                createList (murid : xs) no = do
                    putStrLn $
                        " " ++ show no ++ replicate (columnWidth - 1) ' '
                            ++ " "
                            ++ name murid
                            ++ replicate (spaces name) ' '
                            ++ " "
                            ++ className murid
                            ++ replicate (spaces className) ' '
                            ++ " "
                            ++ show (grade murid)
                            ++ replicate (spaces grade) ' '
                            ++ " "
                            ++ if grade murid >= 60 then "Y" else "N" ++ replicate (columnWidth - 1) ' '
                    createList xs (no + 1)
                  where
                    spaces x = (columnWidth - length (show (x murid))) + 2
            putStrLn line
            putStrLn $
                createColumn title1
                    ++ "|"
                    ++ createColumn title2
                    ++ "|"
                    ++ createColumn title3
                    ++ "|"
                    ++ createColumn title4
                    ++ "|"
                    ++ createColumn title5
            putStrLn line
            createList oldValue 1
            putStrLn line
            addList oldValue
        "q" -> print oldValue
        _ -> do
            putStrLn "Wrong input code, try again"
            print oldValue
            addList oldValue