data IntList
    = Empty
    | Cons Int IntList
    deriving (Show)

myIntList = Cons 2 (Cons (-3) (Cons 5 Empty))

mapIntList :: (Int -> Int) -> IntList -> IntList
mapIntList _ Empty = Empty
mapIntList f (Cons x xs) = Cons (f x) (mapIntList f xs)

addOne x = x + 1
square x = x * x

addOneToAll = mapIntList addOne
absAll = mapIntList abs
squareAll = mapIntList square

-- addOneToAll :: IntList -> IntList
-- addOneToAll Empty = Empty
-- addOneToAll (Cons x xs) = Cons (x + 1) (addOneToAll xs)

-- absAll :: IntList -> IntList
-- absAll Empty = Empty
-- absAll (Cons x xs) = Cons (abs x) (absAll xs)

-- squareAll :: IntList -> IntList
-- squareAll Empty = Empty
-- squareAll (Cons x xs) = Cons (x * x) (squareAll xs)

main :: IO ()
main = do
    print (addOneToAll myIntList)
    print (absAll myIntList)
    print (squareAll myIntList)