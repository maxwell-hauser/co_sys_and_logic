# Computer Systems and Logic - Interactive Examples

This directory contains runnable Python scripts that demonstrate the key concepts from each chapter of the Computer Systems and Logic course.

## Contents

- **ch01_signals_and_number_systems.py** - Introduction to signals and number systems
- **ch02_analog_signals.py** - Analog signal characteristics (amplitude, frequency, phase)
- **ch03_digital_signals.py** - Digital signal representation and bit/byte concepts
- **ch04_number_systems.py** - Different number bases (binary, octal, decimal, hex)
- **ch05_conversions.py** - Converting between number systems
- **ch06_complements.py** - One's and two's complement operations
- **ch07_signed_numbers.py** - Unsigned, signed magnitude, and two's complement
- **ch08_binary_arithmetic.py** - Binary addition and subtraction
- **ch09_floating_point.py** - IEEE 754 floating point representation
- **ch10_bcd.py** - Binary Coded Decimal encoding
- **ch11_coding_schemas.py** - ASCII and Unicode character encoding
- **ch12_parity_bits.py** - Error detection using parity bits
- **ch13_clock_signals.py** - Clock signal properties and timing
- **ch14_transmission_types.py** - Asynchronous vs synchronous transmission
- **ch15_transmission_methods.py** - Serial vs parallel transmission

## Quick Start

### Option 1: Interactive Menu (Recommended)

Run the main menu script to browse and select chapters:

```bash
python run_examples.py
```

This provides an interactive menu where you can:
- Select individual chapters to run
- Run all chapters sequentially
- Navigate easily between examples

### Option 2: Run Individual Chapters

Run any chapter directly:

```bash
python ch01_signals_and_number_systems.py
python ch05_conversions.py
python ch12_parity_bits.py
# ... etc
```

## Requirements

- Python 3.6 or higher
- No external dependencies required (uses only Python standard library)

## Features

Each chapter script includes:
- **Clear examples** demonstrating key concepts
- **Visual representations** where applicable
- **Step-by-step explanations** of calculations
- **Real-world applications** and use cases
- **Summary of key concepts** at the end

## Learning Path

For best learning experience, follow the chapters in order:

1. **Fundamentals (Ch 1-5)**: Signals, number systems, and conversions
2. **Binary Arithmetic (Ch 6-8)**: Complements, signed numbers, and arithmetic
3. **Data Representation (Ch 9-11)**: Floating point, BCD, and character encoding
4. **Communication (Ch 12-15)**: Error detection, timing, and transmission methods

## Examples

### Running Chapter 5 (Conversions):
```bash
$ python py_05_conversions_gh.py

============================================================
CHAPTER 5: Number System Conversions
============================================================

--- Example 1: Decimal to Binary (Division Method) ---
Convert (35)_10 to binary:
  35 ÷ 2 = 17 remainder 1
  17 ÷ 2 = 8 remainder 1
  8 ÷ 2 = 4 remainder 0
  4 ÷ 2 = 2 remainder 0
  2 ÷ 2 = 1 remainder 0
  1 ÷ 2 = 0 remainder 1
Reading remainders bottom-to-top: (100011)_2
...
```

### Using Interactive Menu:
```bash
$ python run_examples.py

======================================================================
          COMPUTER SYSTEMS AND LOGIC
               Interactive Examples
======================================================================

Select a chapter to run:

   1. Chapter 1   - Signals and Number Systems
   2. Chapter 2   - Analog Signals
   3. Chapter 3   - Digital Signals
   ...
  16. Run ALL chapters sequentially
   0. Exit

Enter your choice: 5
```

## Customization

Each script is self-contained and can be modified to:
- Add your own examples
- Change visualization styles
- Experiment with different values
- Add additional test cases

## Corresponding Course Materials

These examples complement the markdown files in each project directory:
- `py_01_signal_and_num_sys_gh/py_01_signal_and_num_sys_gh.md`
- `py_02_analog_signals_gh/py_02_analog_signals_gh.md`
- etc.

Each project is maintained in its own GitHub repository at:
- https://github.com/maxwell-hauser/py_01_signal_and_num_sys_gh
- https://github.com/maxwell-hauser/py_02_analog_signals_gh
- etc.

## Contributing

Feel free to:
- Add more examples
- Improve visualizations
- Fix bugs or typos
- Enhance documentation

## License

These examples are educational materials for the Computer Systems and Logic course.

---

**Happy Learning!**

For questions or issues, refer to the main course materials in the parent directories.
