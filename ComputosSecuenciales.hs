newtype Secuencial s a = Secuencial (s -> (a, s))

-- c)
-- return :: a -> Secuencial s a
-- return x = Secuencial $ \estado -> (x, estado)

-- d)
instance Monad (Secuencial s) where
    --c)
    return :: a -> Secuencial s a
    return x = Secuencial $ \estado -> (x, estado)
    (>>=) :: Secuencial s a -> (a -> Secuencial s b) -> Secuencial s b
    (Secuencial programa) >>= transformador =
        Secuencial $ \estadoInicial ->
            let (resultado, nuevoEstado) = programa estadoInicial
                (Secuencial nuevoPrograma) = transformador resultado
            in nuevoPrograma nuevoEstado


{-
a) Dado que en Haskell, las instancias para (por lo menos este caso) Monads, deben ser de la forma <Constructor> <Argumento>, 
donde Constructor es el nombre del tipo de dato y Argumento es el argumento de tipo que recibe el constructor.

b)  return :: a -> Secuencial s a
    >>= :: Secuencial s a -> (a -> Secuencial s b) -> Secuencial s b
    >> :: Secuencial s a -> Secuencial s b -> Secuencial s b
    fail :: String -> Secuencial s a

e)
    - Identidad izquierda: return a >>= h == h a
Demostracion:
    return a >>= h
    = Secuencial $ \estadoInicial -> (a, estadoInicial) >>= h
    = Secuencial $ \estadoInicial -> h a estadoInicial
    = h a

    - Identidad derecha: m >>= return == m
Demostracion:
    m >>= return
    = Secuencial $ \estadoInicial -> m estadoInicial >>= return
    = Secuencial $ \estadoInicial -> m estadoInicial
    = m

    - Asociatividad: (m >>= g) >>= h == m >>= (\x -> g x >>= h)
Demostracion:
    (m >>= g) >>= h
    = Secuencial $ \estadoInicial -> (m >>= g) estadoInicial >>= h
    = Secuencial $ \estadoInicial -> (Secuencial $ \estado -> (g (fst (m estado)), snd (m estado))) estadoInicial >>= h
    = Secuencial $ \estadoInicial -> h (g (fst (m estadoInicial))) (snd (m estadoInicial))
    = Secuencial $ \estadoInicial -> m estadoInicial >>= (\x -> g x >>= h)
    = m >>= (\x -> g x >>= h)
-}