Require Import ExtrOcamlBasic ExtrOcamlNatInt.
From Example Require Import MyFun.
From Example Require Import InsertionSort.

Extraction "myFun.ml" id .
Extraction "insertionSort.ml" insertion_sort.
