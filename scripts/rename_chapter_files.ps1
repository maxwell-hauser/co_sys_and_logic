# Rename all chapter.md and chapter.py files to match folder names

$chapters = @(
    @{Folder="py_01_signal_and_num_sys_gh"; OldMd="01_signal_and_num_sys.md"; OldPy="01_signals_and_number_systems.py"},
    @{Folder="py_02_analog_signals_gh"; OldMd="ch02_analog_signals.md"; OldPy="ch02_analog_signals.py"},
    @{Folder="py_03_digital_signals_gh"; OldMd="ch03_digital_signals.md"; OldPy="ch03_digital_signals.py"},
    @{Folder="py_04_number_systems_gh"; OldMd="py_04_number_systems_gh.md"; OldPy="ch04_number_systems.py"},
    @{Folder="py_05_conversions_gh"; OldMd="ch05_conversions.md"; OldPy="ch05_conversions.py"},
    @{Folder="py_06_complements_gh"; OldMd="ch06_complements.md"; OldPy="ch06_complements.py"},
    @{Folder="py_07_signed_magnitude_gh"; OldMd="ch07_signed_magnitude.md"; OldPy="ch07_signed_numbers.py"},
    @{Folder="py_08_binary_addition_subtraction_gh"; OldMd="ch08_binary_addition.md"; OldPy="ch08_binary_arithmetic.py"},
    @{Folder="py_09_floating_point_representation_gh"; OldMd="ch09_floating_point_representation.md"; OldPy="ch09_floating_point.py"},
    @{Folder="py_10_binary_coded_decimals_gh"; OldMd="ch10_binary_coded_decimal.md"; OldPy="ch10_bcd.py"},
    @{Folder="py_11_coding_schemas_gh"; OldMd="ch11_coding_schemas.md"; OldPy="ch11_coding_schemas.py"},
    @{Folder="py_12_parity_bits_gh"; OldMd="ch12_parity_bits.md"; OldPy="ch12_parity_bits.py"},
    @{Folder="py_13_clock_signals_gh"; OldMd="ch13_clock_signals.md"; OldPy="ch13_clock_signals.py"},
    @{Folder="py_14_transmission_types_gh"; OldMd="ch14_transmission_types.md"; OldPy="ch14_transmission_types.py"},
    @{Folder="py_15_transmission_methods_gh"; OldMd="ch15_transmission_methods.md"; OldPy="ch15_transmission_methods.py"}
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Renaming Chapter Files" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

foreach ($chapter in $chapters) {
    $folderPath = Join-Path (Get-Location) $chapter.Folder
    
    Write-Host "Processing: $($chapter.Folder)" -ForegroundColor Yellow
    
    # Rename .md file
    $oldMdPath = Join-Path $folderPath $chapter.OldMd
    $newMdPath = Join-Path $folderPath "$($chapter.Folder).md"
    
    if (Test-Path $oldMdPath) {
        if ($oldMdPath -ne $newMdPath) {
            Rename-Item $oldMdPath "$($chapter.Folder).md"
            Write-Host "  Renamed MD: $($chapter.OldMd) -> $($chapter.Folder).md" -ForegroundColor Green
        } else {
            Write-Host "  MD already correct: $($chapter.Folder).md" -ForegroundColor Gray
        }
    } else {
        Write-Host "  MD file not found: $($chapter.OldMd)" -ForegroundColor Red
    }
    
    # Rename .py file
    $oldPyPath = Join-Path $folderPath $chapter.OldPy
    $newPyPath = Join-Path $folderPath "$($chapter.Folder).py"
    
    if (Test-Path $oldPyPath) {
        if ($oldPyPath -ne $newPyPath) {
            Rename-Item $oldPyPath "$($chapter.Folder).py"
            Write-Host "  Renamed PY: $($chapter.OldPy) -> $($chapter.Folder).py" -ForegroundColor Green
        } else {
            Write-Host "  PY already correct: $($chapter.Folder).py" -ForegroundColor Gray
        }
    } else {
        Write-Host "  PY file not found: $($chapter.OldPy)" -ForegroundColor Red
    }
    
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Renaming Complete!" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan
