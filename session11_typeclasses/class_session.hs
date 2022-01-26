class CheckIsi a where
    meth :: a -> String

instance CheckIsi Int where
    meth x = "Isinya integer"

instance CheckIsi Bool where
    meth x = "Isinya boolean"

x :: String
x = meth (10 :: Int)

x2 :: String
x2 = meth (True :: Bool)