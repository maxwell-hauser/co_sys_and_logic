# Test all chapter Python scripts
# Tests each chapter script and reports success/failure

$chapters = @(
    @{Num=1; Folder="py_01_signal_and_num_sys_gh"; File="ch01_signals_and_number_systems.py"},
    @{Num=2; Folder="py_02_analog_signals_gh"; File="ch02_analog_signals.py"},
    @{Num=3; Folder="py_03_digital_signals_gh"; File="ch03_digital_signals.py"},
    @{Num=4; Folder="py_04_number_systems_gh"; File="ch04_number_systems.py"},
    @{Num=5; Folder="py_05_conversions_gh"; File="ch05_conversions.py"},
    @{Num=6; Folder="py_06_complements_gh"; File="ch06_complements.py"},
    @{Num=7; Folder="py_07_signed_magnitude_gh"; File="ch07_signed_numbers.py"},
    @{Num=8; Folder="py_08_binary_addition_subtraction_gh"; File="ch08_binary_arithmetic.py"},
    @{Num=9; Folder="py_09_floating_point_representation_gh"; File="ch09_floating_point.py"},
    @{Num=10; Folder="py_10_binary_coded_decimals_gh"; File="ch10_bcd.py"},
    @{Num=11; Folder="py_11_coding_schemas_gh"; File="ch11_coding_schemas.py"},
    @{Num=12; Folder="py_12_parity_bits_gh"; File="ch12_parity_bits.py"},
    @{Num=13; Folder="py_13_clock_signals_gh"; File="ch13_clock_signals.py"},
    @{Num=14; Folder="py_14_transmission_types_gh"; File="ch14_transmission_types.py"},
    @{Num=15; Folder="py_15_transmission_methods_gh"; File="ch15_transmission_methods.py"}
)

$results = @()

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Testing All Chapter Python Scripts" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

foreach ($chapter in $chapters) {
    $path = Join-Path $chapter.Folder $chapter.File
    Write-Host "Testing Chapter $($chapter.Num): " -NoNewline
    
    if (Test-Path $path) {
        try {
            $output = python $path 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host "PASS" -ForegroundColor Green
                $results += @{Chapter=$chapter.Num; Status="PASS"; Error=""}
            } else {
                Write-Host "FAIL (Exit code: $LASTEXITCODE)" -ForegroundColor Red
                $results += @{Chapter=$chapter.Num; Status="FAIL"; Error="Exit code: $LASTEXITCODE"}
            }
        } catch {
            Write-Host "FAIL" -ForegroundColor Red
            $results += @{Chapter=$chapter.Num; Status="FAIL"; Error=$_.Exception.Message}
        }
    } else {
        Write-Host "MISSING FILE" -ForegroundColor Yellow
        $results += @{Chapter=$chapter.Num; Status="MISSING"; Error="File not found"}
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Test Summary" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
$passed = ($results | Where-Object { $_.Status -eq "PASS" }).Count
$failed = ($results | Where-Object { $_.Status -eq "FAIL" }).Count
$missing = ($results | Where-Object { $_.Status -eq "MISSING" }).Count

Write-Host "Total: $($chapters.Count) | " -NoNewline
Write-Host "Passed: $passed " -ForegroundColor Green -NoNewline
Write-Host "| Failed: $failed " -NoNewline
if ($failed -gt 0) { Write-Host "" -ForegroundColor Red } else { Write-Host "" }
if ($missing -gt 0) { Write-Host "| Missing: $missing" -ForegroundColor Yellow }

if ($failed -gt 0 -or $missing -gt 0) {
    Write-Host "`nFailed/Missing Chapters:" -ForegroundColor Yellow
    $results | Where-Object { $_.Status -ne "PASS" } | ForEach-Object {
        Write-Host "  Chapter $($_.Chapter): $($_.Status) - $($_.Error)"
    }
}

Write-Host ""
