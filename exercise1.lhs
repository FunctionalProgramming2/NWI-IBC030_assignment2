author: Hendrik Werner s4549775

exercise 1.1
============

exercise 1.2
============

In a strict language with applicative order the whole list will be sorted before
taking the head of it so the running time would be O(n^2) as that's the running
time complexity of insertion sort.

In Haskell the running time is only O(n) because we only do the work we need to
do instead of evaluating everything upfront.
