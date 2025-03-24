# Tarık Şamil Şahin 201101060
# Simple Calculator using Lex and Yacc

## Overview

This project implements a simple command-line calculator using Lex (Flex) and Yacc (Bison). The calculator supports integer arithmetic expressions including addition, subtraction, multiplication, division, and parentheses for precedence grouping.

---

## Design Decisions

1. **Tokenization with Lex**: 
   - Lex (`calculator.l`) is used to tokenize the input into meaningful symbols: integers, operators, parentheses, and whitespace.
   - Newline characters are explicitly returned to help Yacc identify the end of an expression.

2. **Parsing with Yacc**: 
   - Yacc (`calculator.y`) defines the grammar rules for arithmetic expressions.
   - Operator precedence and associativity are correctly handled using `%left` declarations.
   - Semantic actions are implemented for each rule to perform the actual computation.
   - Division by zero is detected and reported as an error without crashing the program.

3. **User Interaction**:
   - The calculator reads input interactively from the terminal.
   - Each line is parsed and evaluated immediately after pressing Enter.

---

## Implementation Steps

1. Defined the token patterns in `calculator.l` to recognize:
   - Integers (`[0-9]+`)
   - Arithmetic operators (`+`, `-`, `*`, `/`)
   - Parentheses (`(`, `)`)
   - Newlines and whitespace

2. Created grammar rules in `calculator.y` for:
   - Basic arithmetic operations
   - Parentheses for controlling precedence
   - Error handling for invalid syntax and division by zero

3. Compiled the Lex and Yacc files using the following commands:
   ```
   yacc -d calculator.y
   lex calculator.l
   gcc lex.yy.c y.tab.c -o calculator
   ```

4. Ran the program with:
   ```
   ./calculator
   ```

5. Created a test file (`calculator_test_cases.txt`) containing various expressions for validation.

---

## How to Run

### Compile the program:

```
yacc -d calculator.y
lex calculator.l
gcc lex.yy.c y.tab.c -o calculator
```

### Run interactively:

```
./calculator
```

You can then type expressions like:
```
3 + 5
(2 + 3) * 4
10 / 0
```

### Run from a file:

```
./calculator < calculator_test_cases.txt
```

---

## Files Included

- `calculator.l` – Lex tokenizer specification
- `calculator.y` – Yacc parser and evaluator
- `test_cases.txt` – Sample test expressions
- `README.md` – This documentation file

