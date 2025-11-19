# Computer Systems and Logic Exercises 3
_Originally created 24 December, 2020 by Maxwell Hauser — Updated 4 October, 2025_

1. Simplify following functions in the form of sum of products and product of sums:
    
    >a) F(W, X, Y, Z) = ∑(0, 1, 2, 8, 10, 15)

    >b) F(W, X, Y, Z) = ∑(6, 7, 9, 14)

    >c) F(X, Y, Z) = ∑(0, 1, 3, 7)

    >d) F(X, Y, Z) = XY’Z’ + X’Z’ + Y’Z + X’Y’Z’

<br>

2. Implement the following function using one or more multiplexers:
    
    >a) F(W, X, Y, Z) = ∑(0, 1, 3, 4, 7, 9, 10, 14, 15)

<br>

3. The following truth table is given:
    
    ``` | X | Y | Z || F |
        |---|---|---||---|
        | 0 | 0 | 0 || 0 |
        | 0 | 0 | 1 || 1 |
        | 0 | 1 | 0 || 1 |
        | 0 | 1 | 1 || 0 |
        | 1 | 0 | 0 || 1 |
        | 1 | 0 | 1 || 1 |
        | 1 | 1 | 0 || 1 |
        | 1 | 1 | 1 || 0 |
    ```
    > a) Find function F in form of sum of minterms.

    > b) Use k-map to simply function F.

    > c) Draw logic circuit for function F.

<br>

4. Implement the following functions using one decoder and external gates.

    >a) F1(X, Y, Z) = X’Z’ + X’Y’

    >b) F2(X, Y, Z) = X’Y’Z + XZ’ + XY

<br>

5. Design a combinational circuit with three inputs, X, Y, Z, and one output, F. The output is one if the input is divisible by 2, otherwise the output is zero.

    >a) Show truth table

    >b) Find output function using K-map

    >c) Draw logic circuit

<br>

6. The Following Multiplexer is given, find output value for given select lines

Below is an ASCII reproduction of the multiplexer network shown in the problem image. This is a two-level network of 2:1 multiplexers: two left-side 2:1 MUXes (both selected by S0) feed a final right-side 2:1 MUX (selected by S1).

```
         (constants)

   1 ----+                 +-----------+           +-----------+
         |                 |  2:1 MUX  |-- A --->  |  2:1 MUX  |---> F
         |   +-----------> | (top-left)|          | (final)   |
   0 ----+   |             | S0 select |          | S1 select |
             |             +-----------+          +-----------+
             |                     ^                    ^
             |                     |                    |
             |                     |                    |
             |                     |                    |
   0 ----+   |             +-----------+                |
         |   |             |  2:1 MUX  |-- B ------------+
         |   +-----------> | (bot-left)|
   1 ----+                 | S0 select |
                           +-----------+

Legend:
- Top-left MUX:  D0 = 1, D1 = 0, select = S0  -> output A
- Bot-left MUX:  D0 = 0, D1 = 1, select = S0  -> output B
- Final MUX:      D0 = A (selected when S1 = 0), D1 = B (selected when S1 = 1)
```

Truth table for select lines (S1 S0 -> F):

```
S1 S0 | F
------|---
 0  0 | 1   (final selects A; A = top-left when S0=0 -> 1)
 0  1 | 0   (final selects A; A = top-left when S0=1 -> 0)
 1  0 | 0   (final selects B; B = bot-left when S0=0 -> 0)
 1  1 | 1   (final selects B; B = bot-left when S0=1 -> 1)
```
<img src="co_sys_e3_img1.png" alt="Description" width="400" />

Observation: F = 1 exactly when S1 and S0 are equal, so F = XNOR(S1, S0).

<br>

7. Following Logic Circuit is given
Find output function
Simplify output function
Show truth table for the function

  

  

 20
8.  Draw Logic circuit for following function using only
a. NAND gates
b. NOR gates

  F(X, Y, Z)  =  X’YZ + Y’Z + XZ’



 20
9. Design a 2 bit ALU to perform following functions

  S1 S0           Function
   00                A  OR B
   01                 B’
  10                 A AND B
  11                 A Plus B
