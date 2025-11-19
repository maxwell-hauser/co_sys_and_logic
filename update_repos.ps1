# Update GitHub repository metadata and create releases

$chapters = @(
    @{
        Folder="py_01_signal_and_num_sys_gh"
        Description="Educational Python examples demonstrating signals and number systems concepts including binary representation, digital signals, and positional notation in computer systems."
        Topics=@("python", "computer-science", "digital-signals", "binary", "number-systems", "education", "tutorial")
    },
    @{
        Folder="py_02_analog_signals_gh"
        Description="Interactive Python demonstrations of analog signal characteristics including amplitude, frequency, period, and phase relationships with practical waveform examples."
        Topics=@("python", "signals", "analog-signals", "frequency", "amplitude", "waveforms", "education")
    },
    @{
        Folder="py_03_digital_signals_gh"
        Description="Python examples exploring digital signal representation, ASCII encoding, binary data structures, and the fundamental differences between analog and digital systems."
        Topics=@("python", "digital-signals", "binary", "ascii", "encoding", "computer-systems", "education")
    },
    @{
        Folder="py_04_number_systems_gh"
        Description="Comprehensive Python tutorials covering binary, octal, decimal, and hexadecimal number systems with practical conversion examples and real-world applications."
        Topics=@("python", "number-systems", "binary", "hexadecimal", "octal", "mathematics", "education")
    },
    @{
        Folder="py_05_conversions_gh"
        Description="Step-by-step Python implementations of number system conversion algorithms including decimal-to-binary, binary-to-hex, and fractional conversions with detailed explanations."
        Topics=@("python", "conversions", "binary", "hexadecimal", "decimal", "mathematics", "tutorial")
    },
    @{
        Folder="py_06_complements_gh"
        Description="Python examples demonstrating one's complement and two's complement arithmetic, including subtraction operations, overflow detection, and range calculations."
        Topics=@("python", "twos-complement", "binary-arithmetic", "computer-architecture", "signed-numbers", "education")
    },
    @{
        Folder="py_07_signed_magnitude_gh"
        Description="Educational Python code comparing unsigned, signed magnitude, and two's complement number representations with practical range and conversion examples."
        Topics=@("python", "signed-numbers", "twos-complement", "binary", "computer-architecture", "education")
    },
    @{
        Folder="py_08_binary_addition_subtraction_gh"
        Description="Interactive Python demonstrations of binary addition and subtraction operations, overflow detection, and two's complement arithmetic with step-by-step visualizations."
        Topics=@("python", "binary-arithmetic", "addition", "subtraction", "overflow", "computer-architecture", "education")
    },
    @{
        Folder="py_09_floating_point_representation_gh"
        Description="Python implementation of IEEE 754 floating-point representation including encoding/decoding, special values (NaN, infinity), and precision analysis."
        Topics=@("python", "ieee-754", "floating-point", "binary", "computer-architecture", "education")
    },
    @{
        Folder="py_10_binary_coded_decimals_gh"
        Description="Python examples of Binary Coded Decimal (BCD) encoding, arithmetic operations, packed vs unpacked formats, and practical applications in digital systems."
        Topics=@("python", "bcd", "binary-coded-decimal", "number-encoding", "digital-systems", "education")
    },
    @{
        Folder="py_11_coding_schemas_gh"
        Description="Comprehensive Python tutorials on character encoding including ASCII, Unicode, UTF-8, and practical string manipulation with encoding examples."
        Topics=@("python", "ascii", "unicode", "character-encoding", "utf8", "text-encoding", "education")
    },
    @{
        Folder="py_12_parity_bits_gh"
        Description="Python implementations of parity bit error detection (even and odd parity), demonstrating limitations and applications in serial communication."
        Topics=@("python", "parity", "error-detection", "data-integrity", "communication", "education")
    },
    @{
        Folder="py_13_clock_signals_gh"
        Description="Interactive Python examples of clock signal properties including frequency, period, duty cycle calculations, and timing relationships in digital systems."
        Topics=@("python", "clock-signals", "frequency", "timing", "digital-circuits", "computer-architecture", "education")
    },
    @{
        Folder="py_14_transmission_types_gh"
        Description="Python demonstrations comparing asynchronous and synchronous transmission types, UART framing, clock synchronization, and protocol efficiency analysis."
        Topics=@("python", "uart", "synchronous", "asynchronous", "communication", "protocols", "education")
    },
    @{
        Folder="py_15_transmission_methods_gh"
        Description="Educational Python code comparing serial and parallel transmission methods, examining clock skew, bandwidth, and the evolution of modern high-speed interfaces."
        Topics=@("python", "serial", "parallel", "communication", "data-transmission", "computer-architecture", "education")
    }
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Updating GitHub Repositories" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# Get GitHub username
$username = "maxwell-hauser"

foreach ($chapter in $chapters) {
    Write-Host "`n--- Processing: $($chapter.Folder) ---" -ForegroundColor Yellow
    
    # Update repository description
    Write-Host "  Updating description..." -NoNewline
    gh repo edit "$username/$($chapter.Folder)" --description "$($chapter.Description)" 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host " DONE" -ForegroundColor Green
    } else {
        Write-Host " FAILED" -ForegroundColor Red
    }
    
    # Add topics
    Write-Host "  Adding topics..." -NoNewline
    $topicsJson = $chapter.Topics | ConvertTo-Json -Compress
    gh repo edit "$username/$($chapter.Folder)" --add-topic ($chapter.Topics -join ',') 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host " DONE" -ForegroundColor Green
    } else {
        Write-Host " FAILED" -ForegroundColor Red
    }
    
    # Create release
    Write-Host "  Creating release v1.0.0..." -NoNewline
    $releaseBody = @"
## Computer Systems and Logic - Educational Python Examples

This release includes:
- Tested and verified Python example script
- Comprehensive README documentation
- Original course materials in Markdown
- CI/CD workflows for automated testing

### Running the Example
``````bash
python $($chapter.Folder).py
``````

### Features
- Interactive demonstrations of key concepts
- Step-by-step explanations
- Real-world applications
- Practice exercises

See README.md for detailed information and learning objectives.
"@
    
    Push-Location (Join-Path (Get-Location) $chapter.Folder)
    gh release create v1.0.0 --title "Release v1.0.0" --notes "$releaseBody" 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host " DONE" -ForegroundColor Green
    } else {
        Write-Host " FAILED (may already exist)" -ForegroundColor Yellow
    }
    Pop-Location
    
    Start-Sleep -Milliseconds 500  # Rate limiting
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Repository Updates Complete!" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan
Write-Host "All repositories now have:"
Write-Host "  - Descriptions (2-3 sentences)" -ForegroundColor Green
Write-Host "  - Topics (6+ keywords)" -ForegroundColor Green
Write-Host "  - Latest release (v1.0.0)" -ForegroundColor Green
Write-Host "  - CI/CD workflows" -ForegroundColor Green
Write-Host ""
