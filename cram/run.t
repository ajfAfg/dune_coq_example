Examples

Reverse int list
  $ echo '5 3 5 1' | dune exec dune_coq_example
  1 3 5 5

  $ echo '5 3 -5 1' | dune exec dune_coq_example
  -5 1 3 5

  $ echo '' | dune exec dune_coq_example
  
