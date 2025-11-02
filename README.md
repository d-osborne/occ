# occ: the Oxford CompSoc Continuation language

`occ` is an esolang developed in less than a day for Oxford CompSoc's esolang hackathon, based on the society's continuation over the Latin alphabet. Every keyword is taken from the CompSoc continuation, and the language has **no identifiers**. The language is a **stack machine** with storage for integers at given indexes. All values within `occ` are integers.

## How do I run occ?

To run `occ`, a working installation of the Haskell language is required. Once Haskell is installed on your system, you can simply clone this repository and run `runghc src/Interpreter.hs` to launch the interpreter (`occi`).

To modify `occ`'s parser, an installation of the Happy parser generator library for Haskell is required. Once installed, `Parser.hs` may be generated from `Parser.y` by running `happy src/Parser.y`.