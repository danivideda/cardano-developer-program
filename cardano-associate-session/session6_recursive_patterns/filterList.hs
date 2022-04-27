data List t = E | C t (List t) deriving (Show)

filterList :: (t -> Bool) -> List t -> List t
filterList _ E = E
filterList p (C x xs)
    | p x = C x (filterList p xs)
    | otherwise = filterList p xs

myList = C 2 (C (-3) (C 5 E))

main :: IO ()
main = do
    print (filterList odd myList)
    print (filterList even myList)
    print (filterList (> 3) myList)
    print (filterList (< 0) myList)