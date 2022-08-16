# alpt
*A literate programming tool*
## Usage
Write LaTeX into an input file, and write your code snippets in the following, very cursed fashion:
```
§<filename> : language§ 
  code 
§
```

Then run `./alpt.native your_file`, and it will generate the code for all your snippets (combined by filename) and a LaTeX file containing the docs. If the language you specified is supported by `lstlisting`, the listings will have some simple syntax highlighting, some parameters of which can be controlled from your input file.

## Notes
- Do not use the symbol `§` in the LaTeX (just use `\S` for it) and the code snippets. If the symbol `§` is part of the syntax of your language, then your language is not supported yet. If you need to print that symbol, I'm sure your language of choice has several ways to represent it. To save you the search, it's the unicode character `U + 00A7`.
- I am rather new to Ocaml, so the code for this is quite horrendous. Oh well.
- I'm using `upx --best` to compress the executable, which would otherwise be huge.
- Among the tools you will need are an LaTeX, with the `lstlisting` package, an OCaml installation, `Re2` and `core` (OCaml modules, can be installed from `opam`), `ocamlbuild`, `ocamlfind` and I guess `upx`. If I missed something, do let me know.
