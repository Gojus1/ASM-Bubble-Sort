# ASM-Bubble-Sort

This project implements a **bubble sort algorithm** in x86 assembly using **MASM/TASM** syntax, running on a 16-bit DOS environment.

---

## Features

- Prompts the user to enter a string of characters.
- Sorts the characters using **bubble sort**.
- Outputs the sorted result to the screen.
- Demonstrates use of DOS interrupts for input/output (`INT 21h`).

---

## How to Run

1. Assemble and link the program using **MASM** or **TASM**:
   ```bash
   tasm bubble.asm
   tlink bubble.obj
