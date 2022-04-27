myFunc :: String -> IO String
myFunc str = do
    return str

data MyData = IN | OUT
    deriving (Show, Read)

ex = IN