{-
a) ¿Cual es la forma normalizada para la expresi ́on: (λx . λy . x y y) (λz . z O) L?
    (λx . λy . x y y) (λz . z O) L
    = eval((λx . λy . x y y) (λz . z O)) eval(L)
    = (λy . x y y) [x := eval(λz . z O)] eval(L)
    (Parentesis para indicar que se sustituye x por (λz . z O))
    = [x := (λz . eval(z O))] 
    = [x := (λz . z eval(O))]
    (Continuamos con la sustitucion)
    = (λy . x y y) [x := (λz . z eval(O))] eval(L)
    = (λy . (λz . z eval(O)) y y) eval(L)
    (Resolvemos (λz . z eval(O)) y)
    = (λz . z eval(O)) y
    = (z eval(O)) [z := eval(y)]
    = (z eval(O)) [z := y]
    = (y eval(O))
    ( Continuamos con la sustitucion)
    = (λy . y eval(O) y) eval(L)
    = ( y eval(O) y) [y:= eval(L)]
    = (eval(L) eval(O) eval(L))
    = L O L

b) ¿Existen posibles expresiones E y F, tal que el orden en el que se evaluen las mismas sea relevante (arroje resultados diferentes)?
    Si, por ejemplo:
    E= λx . x
    F= (λy . y y) (λy . y y)
    Si evaluamos primero E F:
    = (λx . x) (λy . y y) (λy . y y)
    = (x) [x := eval(λy . y y)] (λy . y y)
    = (x) [x := (λy . y y)] (λy . y y)
    = (λy . y y) (λy . y y)
    = (y y) [y := eval(λy . y y)]
    = (y y) [y := (λy . y y)]
    = (λy . y y) (λy . y y)

    Si evaluamos primero F E:
    = (λy . y y) (λy . y y) (λx . x)
    = (y y) [y := eval(λy . y y)] (λx . x)
    = (y y) [y := (λy . y y)] (λx . x)
    = (λy . y y) (λx . x)
    = (y y) [y := eval(λx . x)]
    = (y y) [y := (λx . x)]
    = (λx . x) (λx . x)
    = x [x := eval(λx . x)]
    = x [x := (λx . x)]
    = (λx . x)
    Por lo tanto, el orden en el que se evaluen las expresiones es relevante.

c) Para una λ–expresion de la forma ((λx . E) F). ¿Que cambios harıa a la semantica
formal de la funcion eval para este caso, si se permitiesen identificadores repetidos?

    Cuando se permiten identificadores repetidos, la evaluación de una expresión lambda como (λx.E)F
    debe ajustarse, dado que si al sustituir x por F, si F contiene una variable que ya está en uso en E, 
    se debe renombrar dicha variable para evitar confusión. Si no se renombra,
    la evaluación podría no ser correcta, ya que las variables se mezclarían (al menos visualmente).
-}