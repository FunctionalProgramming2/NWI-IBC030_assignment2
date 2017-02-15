author: Hendrik Werner s4549775

exercise 1.1
============

Applicative order:

minimum [2, 7, 1, 9, 6, 5]
{definition of minimum}
= head $ insertionSort [2, 7, 1, 9, 6, 5]
{definition of insertionSort}
= head $ insert $ insertionSort [7, 1, 9, 6, 5]
{6x definition of insertionSort}
= head $ insert 2 $ insert 7 $ ... $ insert 5 []
{definition of insert}
= head $ insert 2 $ insert 7 $ ... $ insert 6 [5]
{definition of insert}
= head $ insert 2 $ insert 7 $ ... $ 5 : insert 6 []
{definition of insert}
= head $ insert 2 $ insert 7 $ ... $ 5 : [6]
{... definition of insert ...}
= head $ 1 : [2, 5, 6, 7, 9]
{definition of head}
= 1

exercise 1.2
============

In a strict language with applicative order the whole list will be sorted before
taking the head of it so the running time would be O(n^2) as that's the running
time complexity of insertion sort.

In Haskell the running time is only O(n) because we only do the work we need to
do instead of evaluating everything upfront.
