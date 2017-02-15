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

exercise 4.1
============

exercise 4.2
============

exercise 4.3
============

exercise 4.4
============

exercise 4.5
============

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

exercise 4.7
============

exercise 4.8
============

exercise 4.9
============
