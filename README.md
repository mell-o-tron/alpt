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
- I am rather new to Ocaml, so the code for this is quite horrendous. Oh well.
- **Bigger problem**: the executable is huge, probably because of the modules i've used, and I have no idea how to strip it down. If any of you has any idea, please let me know.
