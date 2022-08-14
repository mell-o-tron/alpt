# alpt
*A literate programming tool*
## Usage
Write LaTeX into an input file, and write your code snippets in the following, very cursed fashion:
```
§<filename>§ 
  code 
§
```

Then run `./alpt.native your_file`, and it will generate the code for all your snippets (combined by filename) and a LaTeX file containing the docs.

## Note
I am rather new to Ocaml, so the code for this is quite horrendous. Oh well.
