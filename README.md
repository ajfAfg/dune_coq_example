# Proof Driven Development with Coq and dune

This project is an exercise in proof driven development in OCaml's build tool dune. The CLI program implemented in this project sorts a sequence of integers received as standard input and outputs them to standard output.

## Usage

```sh
$ echo '5 3 5 1' | dune exec dune_coq_example
1 3 5 5
```

## Motivation

It is tedious to manually convert from Coq codes to OCaml codes every time. I want the code to be converted by itself at build time, and I want the converted code to be immediately referenceable by other OCaml code.

## Points

References between Coq codes are realized by the following file arrangement:

- Most of the Coq code is placed in `theories` directory.
- Only the Coq code for code extraction is placed in the `lib` directory.

## Future Tasks

- Many boiler plates
  - Setting up `coq.extraction` is a pain. I think `prelude` is necessary (for code identification for code extraction), but I don't see why `extracted_modules` is needed.
- When Coq code for code extraction is opened in CoqIDE, the code is also extracted in the project root.
  - It's a little creepy, though, if we just ignore it with `.gitignore`.
