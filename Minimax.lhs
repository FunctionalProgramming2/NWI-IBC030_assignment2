> {-# LANGUAGE UnicodeSyntax #-}
>
> module Minimax
> where
> -- import Unicode

> type Position = (Integer, Integer)

< moves ∷ Position → [Position]

Multiway trees.

> data Tree elem  =  Node elem [Tree elem]

< gametree ∷ (position → [position]) → (position → Tree position)

< size ∷ Tree elem → Integer

< winning  ∷ Tree position → Bool
< losing   ∷ Tree position → Bool

< evaluate ∷ Integer → Position → Value
< evaluate depth  =  maximize static . prune depth . gametree moves

< prune ∷ Integer → Tree elem → Tree elem

> type Value = Int  -- |[-100 .. 100]|

< static ∷ Position → Value

< maximize  ∷ (position → Value) → (Tree position → Value)
< minimize  ∷ (position → Value) → (Tree position → Value)

--------------------------------------------------------------------------------
author: Hendrik Werner s4549775
author: Anna Tökés s1005628

exercise 4.1
============

> moves :: Position -> [Position]
> moves (a, b) = (splits a) ++ (splits b)
>     where splits a = [(a - x, x) | x <- [1..half a]]
>           half a = a `div` 2

exercise 4.2
============

> gametree :: (position -> [position]) -> (position -> Tree position)
> gametree moves pos = Node pos $ map (gametree moves) (moves pos)

exercise 4.3
============

> size ∷ Tree elem → Integer
> size (Node a ts) = (+1) $ sum $ map size ts

exercise 4.4
============

> winning, losing :: Tree position -> Bool
> winning (Node a ts) = or $ map losing ts
> losing (Node a ts) = and $ map winning ts

exercise 4.5
============
(optional)

This is an application of De Morgan's Laws
    not (A or B) = not A and not B
    not (A and B) = not A or not B

If you look at the definitions of winning and losing you can see that this is
exactly the way they are defined.

You could also argue that one can use the law of excluded middle because you
either win or loose. You loose if you don't win and you win if you don't loose.
If there are only 2 possibilities and you exclude one of them then the other one
must be true.

exercise 4.6
============
(optional)

exercise 4.7
============

> prune :: Integer -> Tree elem -> Tree elem
> prune 0 (Node a _) = (Node a [])
> prune depth (Node a ts) = Node a $ map (prn 1) ts
>     where prn current n@(Node a ts)
>               | current < depth = Node a $ map (prn (current + 1)) ts
>               | otherwise = Node a []

exercise 4.8
============

> static :: Position -> Value
> static (a, b)
>     | odd a && odd b = -100
>     | otherwise = 100

exercise 4.9
============

> maximize :: (position -> Value) -> (Tree position -> Value)
> maximize evaluator (Node a []) = evaluator a
> maximize evaluator (Node _ ts) = maximum $ map (minimize evaluator) ts

> minimize :: (position -> Value) -> (Tree position -> Value)
> minimize evaluator (Node a []) = negate $ evaluator a
> minimize evaluator (Node _ ts) = minimum $ map (maximize evaluator) ts

exercise 4.10
=============
(optional)

exercise 4.11
=============
(optional)
