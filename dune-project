(lang dune 3.13)

(name dune_coq_example)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name dune_coq_example)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune coq)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project

; NOTE: See https://dune.readthedocs.io/en/stable/coq.html

(using coq 0.8)
