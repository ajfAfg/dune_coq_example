open Dune_coq_example

let () =
  read_line ()
  |> Str.split (Str.regexp "[ \t]+")
  |> List.map int_of_string |> InsertionSort.insertion_sort
  |> List.map string_of_int
  (* NOTE:
     This `id` function application is not necessary for the semantics of this program,
     but is used to try to extract code from multiple Coq codes.
  *)
  |> MyFun.id
  |> String.concat " " |> print_endline
