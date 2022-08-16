all: alpt.native

alpt.native: alpt.ml
	ocamlbuild -use-ocamlfind -package re2 -package core -tag thread alpt.native
	./alpt.native inputfile

rebuild:
	ocamlbuild -use-ocamlfind -package re2 -package core -tag thread alpt.native
	./alpt.native inputfile

opam:
	eval $(opam env)

upx:
	upx --best ./_build/alpt.native
