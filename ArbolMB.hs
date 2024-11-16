data ArbolMB a = Vacio
                | RamaM a (ArbolMB a)
                | RamaB a (ArbolMB a) (ArbolMB a)
    deriving Show

{- 
a)
Vacio :: ArbolMB a
RamaM :: a -> ArbolMB a -> ArbolMB a
RamaB :: a -> ArbolMB a -> ArbolMB a -> ArbolMB a
-}

{-
b)
transformarVacio :: b -> b
transformarRamaM :: a -> b -> b
transformarRamaB :: a -> b -> b -> b
 -}

-- c)
plegarArbolMB :: b
              -> (a -> b -> b)
              -> (a -> b -> b -> b)
              -> ArbolMB a
              -> b
plegarArbolMB transVacio transRamaM transRamaB = plegar
    where
        plegar Vacio = transVacio
        plegar (RamaM x y) = transRamaM x (plegar y)
        plegar (RamaB x y z) = transRamaB x (plegar y) (plegar z)


-- d)
sumarArbolMB :: (Num a) => ArbolMB a -> a
sumarArbolMB = plegarArbolMB transVacio transRamaM transRamaB
    where
        transVacio = 0
        transRamaM x acc = x + acc
        transRamaB x acc1 acc2 = x + acc1 + acc2


-- e)
aplanarArbolMB :: ArbolMB a -> [a]
aplanarArbolMB = plegarArbolMB transVacio transRamaM transRamaB
    where
        transVacio = []
        transRamaM x acc = x : acc
        transRamaB x acc1 acc2 = acc1 ++ [x] ++ acc2


-- f)
analizarArbolMB :: (Ord a) => ArbolMB a -> Maybe (a, a, Bool)
analizarArbolMB = plegarArbolMB transVacio transRamaM transRamaB
    where
        transVacio = Nothing
        transRamaM x Nothing = Just (x, x, True)
        transRamaM x (Just (min, max, b)) = Just (min, max, b && min < x && x < max)
        transRamaB x Nothing Nothing = Just (x, x, True)
        transRamaB x (Just (min1, max1, b1)) Nothing = Just (min1, max1, b1 && min1 < x && x < max1)
        transRamaB x Nothing (Just (min2, max2, b2)) = Just (min2, max2, b2 && min2 < x && x < max2)
        transRamaB x (Just (min1, max1, b1)) (Just (min2, max2, b2)) = Just (min1, max2, b1 && b2 && min1 < x && x < max2)

{- 
g) Para crear una función plegarGen para un tipo de datos Gen a con n constructores diferentes,
la función plegarGen debera tomar n funciones como argumento (además del valor de tipo Gen a que se desea plegar),
dado que cada constructor es diferente y puede requerir un tratamiento distinto.

h) La función predefinida en el Preludio de Haskell que tiene una firma y un comportamiento
similar a la función de plegado propuesta es 'foldr'. Esta función tiene un tipo de la forma:
foldr :: (a -> b -> b) -> b -> [a] -> b. Aplica de manera recursiva una función a cada elemento de una lista, acumulando un resultado.
-}