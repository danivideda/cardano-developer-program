data ExprT
    = Lit Int
    | Add ExprT ExprT
    | Mul ExprT ExprT
    deriving (Show, Eq)

eval :: ExprT -> Int
eval (Lit i) = i
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2
