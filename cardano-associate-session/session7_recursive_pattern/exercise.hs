-- TASK 1
data NonEmptyList a = NEL a [a] deriving (Show)

-- TASK 2
nelToList :: NonEmptyList a -> [a]
nelToList (NEL a b) = a : b

-- TASK 3
listToNEL :: [a] -> Maybe (NonEmptyList a)
listToNEL [] = Nothing
listToNEL (x : xs) = Just (NEL x xs)

-- TASK 4
headNEL :: NonEmptyList a -> a
headNEL (NEL a b) = a

-- TASK 5
tailNEL :: NonEmptyList a -> [a]
tailNEL (NEL a b) = b