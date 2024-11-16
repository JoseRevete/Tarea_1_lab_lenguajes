{-
id :: a -> a
id x = x

const :: a -> b -> a
const x _ = x

subs :: (a -> b -> c) -> (a -> b) -> a -> c
subs x y z = x z (y z)

a) Evalue la expresion: subs (id const) const id. No evalue la expresion en Haskell, pues si el resultado
es una funcion no podra imprimirlo. Evalue la expresion a mano y exponga el resultado en termino de las
funciones antes propuestas (utilice evaluacion normal: primero la funcion, luego los argumentos).

Respuesta:
    subs (id const) const id
    = (id const) id (const id)
    = const id (const id)
    = id

b) Proponga una expresion (únicamente compuesta por las funciones definidas anteriormente), que no esté en
forma normal, cuya evaluación resulte en la misma expresión y por lo tanto nunca termine.

Respuesta:
    subs id id (subs id id)
    = id (subs id id) (id (subs id id))
    = (subs id id) (subs id id)
    = subs id id (subs id id)


c) Reimplemente la funcion id en terminos de const y sub. (Pista: puede utilizar el tipo unitario () para
representar un argumento del cual no importa su valor, pero que igual debe ser pasado como parametro a
una funcion.)

Respuesta:
    id' :: a -> a
    id' = subs (const (const x)) (const (const x)) ()


d) Discuta la relacion entre las funciones propuestas y el calculo de combinadores SKI.

Respuesta:
    Las funciones propuestas (id, const, y subs) están directamente relacionadas con el calculo de combinadores SKI, de la
    siguiente manera:

    - id es como el combinador I: La función id devuelve el mismo valor que recibe, exactamente lo que hace el combinador I en SKI.
    Es la identidad.

    - const es como el combinador K: La función const toma dos argumentos y siempre devuelve el primero, ignorando el segundo.
    Esto es exactamente lo que hace el combinador K.

    - subs es como el combinador S: La función subs aplica una función a dos argumentos que, a su vez, dependen del mismo valor.
    Esto es lo mismo que hace el combinador S en SKI, que "distribuye" funciones.

-}