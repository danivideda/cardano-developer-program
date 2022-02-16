data User = User
    { name :: String
    , classNumber :: String
    }
    deriving (Show)

database :: [(Integer, User)]
database =
    [ (1, (User{name = "Rossa", classNumber = "2-1"}))
    , (2, (User{name = "Rudi", classNumber = "2-2"}))
    , (3, (User{name = "Cahyo", classNumber = "1-4"}))
    , (4, (User{name = "Melissa", classNumber = "3-7"}))
    ]

findStudent :: Integer -> String
findStudent number = extractMaybe $ lookup number database

extractMaybe :: Maybe User -> String
extractMaybe (Just user) = "Student Name: " ++ name user ++ ", class: " ++ classNumber user
extractMaybe Nothing = "Data not found"