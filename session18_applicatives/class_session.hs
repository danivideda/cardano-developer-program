import Data.Char
import Data.List

-- main = do
--     print (fmap (+ 7) (Just 10))
--     print (fmap (+ 7) Nothing)

-- main :: IO ()
-- main = do
--     line <- getLine
--     let line' = reverse line
--     putStrLn $ "You said " ++ line' ++ " backwards!"

-- >>> reverse "emurgo"
-- "ogrume"

-- >>> head [2, 2, 3]
-- 2

data User = User String deriving (Show)

newtype User2 = User2 String

greet :: User -> String
greet (User name) = "Hello " ++ name

greet2 :: User2 -> String
greet2 (User2 name) = "Hello " ++ name

-- >>> (+) <$> Just 2 <*> Just 3
-- Just 5

-- utility functor <$>
-- applicative functor <*>
-- <**>

-- main = do
--     let result1 = (+ 100) <$> Just 300
--     let result2 = (* 10) <$> Just 50
--     let result3 = (/ 2) <$> Just 50
--     let result4 = (+ 3) <$> Just 330
--     let result5 = (+ 45) <$> Just 300
--     let result6 = (* 2) <$> Just 30
--     let result7 = (/ 5) <$> Just 300

--     print result1
--     print result2
--     print result3
--     print result4
--     print result5
--     print result6
--     print result7

data Employee = Employee
    { name :: String
    , phone :: String
    }
    deriving (Show)

m_name1, m_name2 :: Maybe String
m_name1 = Nothing
m_name2 = Just "Brent"

m_phone1, m_phone2 :: Maybe String
m_phone1 = Nothing
m_phone2 = Just "91-999"

exA = Employee <$> m_name1 <*> m_phone1
exB = Employee <$> m_name1 <*> m_phone2
exC = Employee <$> m_name2 <*> m_phone1
exD = Employee <$> m_name2 <*> m_phone2