type Conjunto a = a -> Bool

-- a)
miembro :: Conjunto a -> a -> Bool
miembro c x = c x

-- b)
vacio :: Conjunto a
vacio = \_ -> False

-- c)
singleton :: (Eq a) => a -> Conjunto a
singleton x = \y -> x == y

-- d)
desdeLista :: (Eq a) => [a] -> Conjunto a
desdeLista xs = \x -> elem x xs

-- e)
complemento :: Conjunto a -> Conjunto a
complemento c = \x -> not (c x)

-- f)
union :: Conjunto a -> Conjunto a -> Conjunto a
union c1 c2 = \x -> c1 x || c2 x

-- g)
interseccion :: Conjunto a -> Conjunto a -> Conjunto a
interseccion c1 c2 = \x -> c1 x && c2 x

-- h)
diferencia :: Conjunto a -> Conjunto a -> Conjunto a
diferencia c1 c2 = \x -> c1 x && not (c2 x)

-- i)
transformar :: (b -> a) -> Conjunto a -> Conjunto b
transformar f c = \x -> c (f x)

transformar' :: (b -> a) -> Conjunto a -> Conjunto b
transformar' f c = c . f