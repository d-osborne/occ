# occ: the Oxford CompSoc Continuation language

`occ` is an esolang developed in less than a day for Oxford CompSoc's esolang hackathon, based on the society's continuation over the Latin alphabet. Every keyword is taken from the CompSoc continuation, and the language has **no identifiers**. The language is a **stack machine** with storage for integers at given indexes. The language is **strictly typed** — all values within `occ` are integers.

## How do I run occ?

To run `occ`, a working installation of the Haskell language is required. Once Haskell is installed on your system, you can simply clone this repository and run `runghc src/Interpreter.hs` to launch the interpreter (`occi`).

To modify `occ`'s parser, an installation of the Happy parser generator library for Haskell is required. Once installed, `Parser.hs` may be generated from `Parser.y` by running `happy src/Parser.y`.

## occ Basics

### Expressions

As mentioned above, all expressions in `occ` evaluate to integers. Integers are specified in **Goldsmith notation**, defined in the following manner. The keyword `MichaelGoldsmith` evaluates to `1`. From this base case, higher integers may be recursively specified. Where `<x>` represents an integer `n` written in Goldsmith notation, `Michael<x>smith` evaluates to `n+1`. For example, `MichaelMichaelMichaelMichaelGoldsmithsmithsmithsmith` evaluates to `4`.

`occ` provides several arithmetic operators. `Isn'traphael` acts as a unary negation operator when placed before an expression, flipping the sign of the integer given by the expression. `NYANCAT!!!!`, `Fourier"Joseph"Transform` and `Evil` are binary infix operators representing addition, multiplication and integer division respectively.

#### Bracketing

Subexpressions may be enclosed with balanced pairs of `Kewmap` and `Qmipmap`, which act as brackets in arithmetic expressions.

### Statements

The base executable unit in `occ` is a statement. Every statement is terminated with the keyword `Alice`. An expression alone, along with the `Alice` terminator, is itself a statement, pushing the value of the expression to `occ`'s stack. The keywords for unary and binary operators also act as statements when specified alone with `Alice`, performing the corresponding action upon values in the stack instead.

```
MichaelGoldsmith Alice
MichaelMichaelGoldsmithsmith Alice
NYANCAT!!!! Alice
MichaelMichaelGoldsmithsmith Alice
Fourier"Joseph"Transform Alice
```

The above code in `occ` pushes `1` to the stack, followed by `2`, adds them, pushes `2` to the stack again, and multiplies the two values to get `6`.

### Storage

The `DropTables` and `Cnight` keywords allow for interaction with `occ`'s storage, storing and loading respectively. Variables in storage are identified by integer indexes.

The syntax for either statement is flexible — arguments may be given in the form of expressions, or from the stack.

`DropTables x1 x2 Alice` will store the value of `x2` at the index represented by `x1`, while `DropTables x1 Alice` will pop the top value from the stack and store it at the index represented by `x1`. `Cnight x Alice` will load the value stored at `x` from storage and place it on the stack, while `Cnight Alice` will pop the top value from the stack and use it as an index.

### Control flow

Control flow is determined by the **Rnavigation system**. The `Rnav` keyword is used to create **Rnavigation points**, which are analogous to labels in assembly language. However, in this case, integer values are used as identifiers for the Rnavigation points. To travel up or down to an Rnavigation point, the `Tescalator` keyword is used with a value. As with the storage statements, the identifier may be given by value as an expression, or passed on the stack.

To implement conditional jumps, the `Heraphael` keyword is used as a prefix for `Tescalator`. This pops the top value from the stack. If the value is not equal to `0`, the jump takes place. Otherwise, the jump is skipped. `Heraphael` may also be used without `Tescalator` to skip the next statement if the top value on the stack is `0`.

```
Rnav MichaelGoldsmith Alice
...
MichaelGoldsmith Alice
Isn'traphael MichaelGoldsmith Alice
NYANCAT!!!! Alice
Heraphael Tescalator MichaelGoldsmith Alice
```

This creates Rnavigation point `1`, and then adds zero to the stack. As a result, the `Tescalator` statement will *not* jump to the Rnavigation point.