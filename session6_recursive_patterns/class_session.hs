data IntList
    = Empty
    | Cons Int IntList
    deriving (Show)

addOneToAll :: IntList -> IntList
addOneToAll Empty = Empty
addOneToAll (Cons x xs) = Cons (x + 1) (addOneToAll xs)

myIntList = Cons 2 (Cons (-3) (Cons 5 Empty))

absAll :: IntList -> IntList
absAll Empty = Empty
absAll (Cons x xs) = Cons (abs x) (absAll xs)

main :: IO ()
main = do
    print (addOneToAll myIntList)
    print (absAll myIntList)