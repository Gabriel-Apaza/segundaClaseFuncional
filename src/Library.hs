module Library where
import PdePreludat

doble :: Number -> Number -- defino doble como un numero
doble numero = 2 * numero

siguiente :: Number -> Number -- siguiente es una funcion que va de numeros a numeros
siguiente nro = nro + 1

-- funcion suma esta currificada (porque puedo invocarla parcialmente)
suma :: Number -> Number -> Number -- funcion suma espera un numero para devolver otra funcion que espera un numero y devuelve un numero
suma x y  = x + y

-- funcion suma no esta currificada (porque espera los argumentos todos juntos)
suma' :: (Number, Number) -> Number -- esta funcion espera un tupla, para devolver un numero
suma' (x, y) =  x + y

-- funcion suma''' esta currificada (porque puedo invocarla parcialmente)
suma''' :: Number -> Number -> Number -> Number
suma''' x y z = x + y + z

-- Conocer si el siguiente de un numero es par
esParSiguiente :: Number -> Bool
esParSiguiente nro = (even.siguiente) nro

-- Conocer si el numero siguiente de suma 7 es impar
esImparSigSumaSiete :: Number -> Bool
esImparSigSumaSiete nro = (odd.siguiente.suma 7) nro -- odd para ver si es impar en nro

-- expresiones lambda - funciones anonimas
-- ej: (\x -> x + 2) 7 -------> 9
-- (\x -> \y -> x + y) 4 3 ---> 7

--Lista - PATTERN MATCHING
cabeza :: [Number] -> Number
cabeza (cab:_) = cab -- con pattern matching separo la estructura compuesta (lista), en cabeza y cola

-- creando nuestra propia funcion
sayHello :: String -> String
sayHello nombre = "Hello " ++ nombre ++ "!"

-- 3) Definir la función notaMaxima que dado un alumno devuelva la máxima
-- nota del alumno. (Nota resolverlo sin guardas).
-- type Nota = Number
-- type Alumno = (String, Nota, Nota, Nota)

type Nota = Number
type Alumno = (String, Nota, Nota, Nota)

notaMaxima :: Alumno -> Nota
notaMaxima (_, nota1, nota2, nota3) = (max nota1 . max nota2) nota3
-- ej: notaMaxima ("Gabriel", 6,8,10) -----> 10

-- 4) Definir la función cuadruple reutilizando la función doble

cuadruple :: Number -> Number
cuadruple num = (doble . doble) num -- reutilizo doble 2 veces, para tener el cuadruple de un numero 

-- 5) Definir la función esMayorA, que verifique si el doble del siguiente de la
-- suma entre 2 y un número es mayor a 10.

esMayorA :: Number -> Bool
esMayorA unNum = ((>10).doble.siguiente.suma 2) unNum -- a suma 2 le aplico siguiente y luego funcion doble y una aplicacion parcial >10
-- ej: esMayorA 3 --> le suma 2, luego siguiente:6, luego doble: 12, y compara 12>10 --> True

-- 6) Dar expresiones lambda que sean equivalentes a las siguientes expresiones:
-- 1) triple
-- 2) siguiente
-- 3) suma
-- 4) sumarDos

{- triple
(\x -> x * 3)
-}
triple nro = nro * 3

{- siguiente
    (\nro -> nro + 1)
-}
siguiente' nro = nro + 1

{- suma
    (\x y -> x + y)
-}

{- sumaDos
    (\x -> x + 2)
-}

-- 7) Dada las siguientes definiciones:
-- 7.1) apply f x = f x
-- ¿ A qué se reduce la siguiente expresión ?.
-- > apply fst (const 5 7, 4)

-- const en una funcion que devuelve el primer elemento.
-- ej: const 4 6 ---> 4
apply f x = f x
-- > apply fst (const 5 7, 4)
-- > apply fst (   5    , 4)
-- > 5

-- 7.2) twice f x = (f . f) x
-- ¿ A qué se reduce la siguiente expresión ?.
-- > twice (`div` 2) 12

twice f x = (f . f) x
-- > twice (`div` 2) 12  (divide 12 a 2, y luego de nuevo a 2, resultando 3)
-- > 3

