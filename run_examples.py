#!/usr/bin/env python3
"""
Main Runner Script for Computer Systems and Logic Examples
Provides an interactive menu to run all chapter examples
"""

import sys
import os

def print_banner():
    """Print the main banner"""
    print("\n" + "=" * 70)
    print(" " * 10 + "COMPUTER SYSTEMS AND LOGIC")
    print(" " * 15 + "Interactive Examples")
    print("=" * 70)

def print_menu():
    """Print the chapter selection menu"""
    print("\n📚 Select a chapter to run:")
    print()
    
    chapters = [
        ("Chapter 1", "Signals and Number Systems"),
        ("Chapter 2", "Analog Signals"),
        ("Chapter 3", "Digital Signals"),
        ("Chapter 4", "Number Systems"),
        ("Chapter 5", "Number System Conversions"),
        ("Chapter 6", "Complements (One's and Two's)"),
        ("Chapter 7", "Signed Numbers (Magnitude & Two's Comp)"),
        ("Chapter 8", "Binary Addition and Subtraction"),
        ("Chapter 9", "Floating Point Representation (IEEE 754)"),
        ("Chapter 10", "Binary Coded Decimal (BCD)"),
        ("Chapter 11", "Coding Schemas (ASCII and Unicode)"),
        ("Chapter 12", "Parity Bits (Error Detection)"),
        ("Chapter 13", "Clock Signals"),
        ("Chapter 14", "Transmission Types (Async vs Sync)"),
        ("Chapter 15", "Transmission Methods (Serial vs Parallel)")
    ]
    
    for i, (chapter, title) in enumerate(chapters, 1):
        print(f"  {i:2d}. {chapter:11s} - {title}")
    
    print()
    print("  " + "-" * 64)
    print("  16. Run ALL chapters sequentially")
    print("  " + "-" * 64)
    print("   0. Exit")
    print()

def run_chapter(chapter_num):
    """Run a specific chapter example"""
    # Map chapter numbers to their folder and file paths
    chapter_info = {
        1: ("py_01_signal_and_num_sys_gh", "py_01_signal_and_num_sys_gh.py"),
        2: ("py_02_analog_signals_gh", "py_02_analog_signals_gh.py"),
        3: ("py_03_digital_signals_gh", "py_03_digital_signals_gh.py"),
        4: ("py_04_number_systems_gh", "py_04_number_systems_gh.py"),
        5: ("py_05_conversions_gh", "py_05_conversions_gh.py"),
        6: ("py_06_complements_gh", "py_06_complements_gh.py"),
        7: ("py_07_signed_magnitude_gh", "py_07_signed_magnitude_gh.py"),
        8: ("py_08_binary_addition_subtraction_gh", "py_08_binary_addition_subtraction_gh.py"),
        9: ("py_09_floating_point_representation_gh", "py_09_floating_point_representation_gh.py"),
        10: ("py_10_binary_coded_decimals_gh", "py_10_binary_coded_decimals_gh.py"),
        11: ("py_11_coding_schemas_gh", "py_11_coding_schemas_gh.py"),
        12: ("py_12_parity_bits_gh", "py_12_parity_bits_gh.py"),
        13: ("py_13_clock_signals_gh", "py_13_clock_signals_gh.py"),
        14: ("py_14_transmission_types_gh", "py_14_transmission_types_gh.py"),
        15: ("py_15_transmission_methods_gh", "py_15_transmission_methods_gh.py")
    }
    
    if chapter_num not in chapter_info:
        print(f"❌ Invalid chapter number: {chapter_num}")
        return False
    
    folder, filename = chapter_info[chapter_num]
    # Get the workspace root (where this script is located)
    workspace_root = os.path.dirname(os.path.abspath(__file__))
    filepath = os.path.join(workspace_root, folder, filename)
    
    if not os.path.exists(filepath):
        print(f"❌ Chapter file not found: {filename}")
        return False
    
    print(f"\n{'=' * 70}")
    print(f"Running: {filename}")
    print(f"{'=' * 70}\n")
    
    # Import and run the chapter module
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            code = f.read()
            exec(code, {'__name__': '__main__'})
        return True
    except Exception as e:
        print(f"\n❌ Error running chapter {chapter_num}: {e}")
        return False

def run_all_chapters():
    """Run all chapters sequentially"""
    print("\n" + "=" * 70)
    print("Running ALL chapters sequentially...")
    print("=" * 70)
    
    for i in range(1, 16):
        run_chapter(i)
        
        if i < 15:  # Don't prompt after last chapter
            print("\n" + "-" * 70)
            response = input("Press Enter to continue to next chapter (or 'q' to return to menu): ")
            if response.lower() == 'q':
                break
            print()

def main():
    """Main program loop"""
    while True:
        print_banner()
        print_menu()
        
        try:
            choice = input("Enter your choice: ").strip()
            
            if choice == '0':
                print("\n👋 Thank you for using the Computer Systems and Logic examples!")
                print("   Happy learning! 🚀\n")
                sys.exit(0)
            
            choice_num = int(choice)
            
            if choice_num == 16:
                run_all_chapters()
            elif 1 <= choice_num <= 15:
                run_chapter(choice_num)
            else:
                print("\n❌ Invalid choice. Please enter a number between 0 and 16.")
            
            # Pause before returning to menu
            print("\n" + "-" * 70)
            input("Press Enter to return to main menu...")
            
        except ValueError:
            print("\n❌ Invalid input. Please enter a number.")
            input("Press Enter to continue...")
        except KeyboardInterrupt:
            print("\n\n👋 Exiting... Goodbye!\n")
            sys.exit(0)
        except Exception as e:
            print(f"\n❌ An error occurred: {e}")
            input("Press Enter to continue...")

if __name__ == "__main__":
    main()
