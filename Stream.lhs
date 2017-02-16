> {-# LANGUAGE UnicodeSyntax #-}
>
> module Stream
> where
> import Prelude hiding (head, tail, repeat, map, zip, take, sum)
> -- import Unicode

> data Stream elem  =  Cons { head :: elem, tail :: Stream elem }
>
> infixr 5 ≺
> (≺)    ∷  elem → Stream elem → Stream elem
> a ≺ s  =   Cons a s

> from ∷ Integer → Stream Integer
> from n = n ≺ from (n + 1)

< repeat ::  a -> Stream a

< map :: (a -> b) -> (Stream a -> Stream b)

< zip :: (a -> b -> c) -> (Stream a -> Stream b -> Stream c)

< instance (Num elem) ⇒ Num (Stream elem) where

< nat, fib ∷ Stream Integer
< nat  =  0 ≺ nat + 1
< fib  =  0 ≺ 1 ≺ fib + tail fib

< take ∷ Integer → Stream elem → [elem]

< diff :: (Num elem) => Stream elem -> Stream elem
< diff s  =  tail s - s

< sum :: (Num elem) => Stream elem -> Stream elem

--------------------------------------------------------------------------------
author: Hendrik Werner s4549775
author: Anna Tökés s1005628

exercise 3.1
============

> repeat :: a -> Stream a
> repeat a = a ≺ repeat a

> map :: (a -> b) -> (Stream a -> Stream b)
> map f s = f (head s) ≺ map f (tail s)

> zip :: (a -> b -> c) -> (Stream a -> Stream b -> Stream c)
> zip f sa sb = f (head sa) (head sb) ≺ zip f (tail sa) (tail sb)

exercise 3.2
============

> instance (Num elem) => Num (Stream elem) where
>  (+) sa sb = zip (Prelude.+) sa sb
>  (*) sa sb = zip (Prelude.*) sa sb
>  abs s = map (Prelude.abs) s
>  signum s = map (Prelude.signum) s
>  fromInteger s = Prelude.fromInteger s
>  negate s = map (Prelude.negate) s

exercise 3.3
============

> take :: Integer -> Stream elem -> [elem]
> take 0 _ = []
> take n (Cons x xs) = x : (take (n-1) xs)

exercise 3.4
============

> diff :: (Num elem) => Stream elem -> Stream elem
> diff s = tail s - s

> sum :: (Num elem) => Stream elem -> Stream elem
> sum s = Cons 0 (sm 0 s)
>     where sm n (Cons h t) = Cons m (sm m t) where m = n + h
