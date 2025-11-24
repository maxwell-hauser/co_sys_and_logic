# Computer Systems and Logic - Interactive Examples

A comprehensive collection of 16 Python-based interactive learning modules covering fundamental computer systems and digital logic concepts. Each chapter includes runnable examples, visualizations, and hands-on demonstrations using only Python's standard library.

## 📚 Overview

This repository serves as the central hub for a complete Computer Systems and Logic course, with each chapter maintained as an independent project in its own repository. All examples are designed to be educational, self-contained, and runnable without external dependencies.

## 🎯 Quick Start

### Interactive Menu (Recommended)

```bash
python run_examples.py
```

Run the main launcher to access an interactive menu where you can:
- Browse and select individual chapters
- Run all chapters sequentially
- Navigate easily between topics

### Run Individual Chapters

```bash
python py_01_signal_and_num_sys_gh/py_01_signal_and_num_sys_gh.py
python py_05_conversions_gh/py_05_conversions_gh.py
python py_12_parity_bits_gh/py_12_parity_bits_gh.py
```

## 📂 Repository Structure

Folders:
- **py_01_signal_and_num_sys_gh/**
- **py_02_analog_signals_gh/**
- **py_03_digital_signals_gh/**
- **py_04_number_systems_gh/**
- **py_05_conversions_gh/**
- **py_06_complements_gh/**
- **py_07_signed_magnitude_gh/**
- **py_08_binary_addition_subtraction_gh/**
- **py_09_floating_point_representation_gh/**
- **py_10_binary_coded_decimals_gh/**
- **py_11_coding_schemas_gh/**
- **py_12_parity_bits_gh/**
- **py_13_clock_signals_gh/**
- **py_14_transmission_types_gh/**
- **py_15_transmission_methods_gh/**
- **py_16_course_summary_and_exercises_gh/**

### Root Files
- `run_examples.py` - Interactive chapter launcher
- `README.md` - This file
- `LICENSE` - MIT License
- `.gitignore` - Git ignore rules
- `.github/workflows/ci.yml` - CI/CD workflow for testing all chapters

### Automation Scripts (`scripts/`)
- `add_workflows.ps1` - Add CI/CD workflows to projects
- `update_repos.ps1` - Update all project repositories
- `rename_chapter_files.ps1` - Standardize file naming
- `git_init_and_push.ps1` - Initialize and push to GitHub
- `test_all_chapters.ps1` - Run tests across all chapters

## ✨ Features

Each chapter includes:
- ✅ **Clear examples** demonstrating key concepts
- 📊 **Visual representations** using ASCII art and formatted output
- 🔢 **Step-by-step explanations** of calculations and conversions
- 🌍 **Real-world applications** and practical use cases
- 📝 **Comprehensive documentation** in both code and markdown
- 🧪 **Self-contained examples** requiring no external dependencies
- 🚀 **CI/CD integration** for automated testing across Python 3.8-3.12

## 🔧 Requirements

- **Python 3.8+** (tested on 3.8, 3.9, 3.10, 3.11, 3.12)
- **No external dependencies** - uses only Python standard library
- Works on Windows, macOS, and Linux

## 🗺️ Learning Path

For the best learning experience, follow chapters in order:

### Part 1: Fundamentals (Chapters 1-5)
- Digital vs analog signals
- Number systems (binary, octal, decimal, hexadecimal)
- Conversions between number systems
- Understanding bits, bytes, and data representation

### Part 2: Binary Arithmetic (Chapters 6-8)
- One's and two's complement
- Signed magnitude representation
- Binary addition and subtraction
- Overflow detection

### Part 3: Data Representation (Chapters 9-11)
- IEEE 754 floating-point representation
- Binary Coded Decimal (BCD)
- ASCII and Unicode character encoding

### Part 4: Communication & Transmission (Chapters 12-15)
- Parity bits for error detection
- Clock signals and timing
- Asynchronous vs synchronous transmission
- Serial vs parallel transmission methods

### Part 5: Course Summary (Chapter 16)
- Comprehensive review
- Practice exercises
- Interactive problem-solving

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

## 🔗 Individual Project Repositories

Each chapter is maintained as an independent GitHub repository with its own:
- Complete documentation (README.md)
- Python implementation
- CI/CD workflows
- Release tags
- MIT LICENSE

All repositories follow the naming convention: `py_XX_topic_name`

For direct access, visit: [Maxwell Hauser's GitHub](https://github.com/maxwell-hauser)

## 🎨 Customization

Each script is self-contained and can be easily modified to:
- Add your own examples and test cases
- Customize visualization styles
- Experiment with different values
- Extend functionality for specific use cases
- Integrate into your own projects

## 📖 Documentation

Each project directory contains comprehensive markdown documentation explaining the concepts in detail. Visit the individual project folders or their respective GitHub repositories for:
- Detailed theory and explanations
- Additional examples and practice problems
- Visual diagrams and illustrations
- Further study recommendations

## 🔬 Testing & CI/CD

This repository includes comprehensive CI/CD workflows that:
- Test all 16 chapters across Python 3.8-3.12
- Verify functionality on Ubuntu runners
- Automatically run on push to main/master branches
- Ensure code quality and compatibility

Run tests locally:
```bash
python scripts/test_all_chapters.ps1
```

## 🤝 Contributing

Contributions are welcome! Feel free to:
- 🐛 Report bugs or issues
- ✨ Add new examples or features
- 📊 Improve visualizations
- 📝 Enhance documentation
- 🧪 Add test cases
- 🎨 Refactor code for clarity

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Copyright (c) 2025 Maxwell Hauser

## 👨‍💻 Author

**Maxwell Hauser**
- GitHub: [@maxwell-hauser](https://github.com/maxwell-hauser)
- Created: November 2025

## 🎓 Educational Use

These materials are designed for educational purposes and are freely available for:
- Academic courses and curricula
- Self-study and independent learning
- Teaching computer science fundamentals
- Workshop and training materials

---

**Happy Learning! 🚀**

For questions, issues, or suggestions, please open an issue in this repository or contact the individual project repositories.
