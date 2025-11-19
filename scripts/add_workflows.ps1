# Add CI/CD workflows to all projects and push changes

$chapters = @(
    @{Num="01"; Folder="py_01_signal_and_num_sys_gh"; Title="Signals and Number Systems"; Topics=@("python", "computer-science", "digital-signals", "binary", "number-systems", "education", "tutorial")},
    @{Num="02"; Folder="py_02_analog_signals_gh"; Title="Analog Signals"; Topics=@("python", "signals", "analog-signals", "frequency", "amplitude", "waveforms", "education")},
    @{Num="03"; Folder="py_03_digital_signals_gh"; Title="Digital Signals"; Topics=@("python", "digital-signals", "binary", "ascii", "encoding", "computer-systems", "education")},
    @{Num="04"; Folder="py_04_number_systems_gh"; Title="Number Systems"; Topics=@("python", "number-systems", "binary", "hexadecimal", "octal", "mathematics", "education")},
    @{Num="05"; Folder="py_05_conversions_gh"; Title="Number System Conversions"; Topics=@("python", "conversions", "binary", "hexadecimal", "decimal", "mathematics", "tutorial")},
    @{Num="06"; Folder="py_06_complements_gh"; Title="Complements (One's and Two's)"; Topics=@("python", "twos-complement", "binary-arithmetic", "computer-architecture", "signed-numbers", "education")},
    @{Num="07"; Folder="py_07_signed_magnitude_gh"; Title="Signed Numbers and Two's Complement"; Topics=@("python", "signed-numbers", "twos-complement", "binary", "computer-architecture", "education")},
    @{Num="08"; Folder="py_08_binary_addition_subtraction_gh"; Title="Binary Addition and Subtraction"; Topics=@("python", "binary-arithmetic", "addition", "subtraction", "overflow", "computer-architecture", "education")},
    @{Num="09"; Folder="py_09_floating_point_representation_gh"; Title="Floating Point Representation (IEEE 754)"; Topics=@("python", "ieee-754", "floating-point", "binary", "computer-architecture", "education")},
    @{Num="10"; Folder="py_10_binary_coded_decimals_gh"; Title="Binary Coded Decimal (BCD)"; Topics=@("python", "bcd", "binary-coded-decimal", "number-encoding", "digital-systems", "education")},
    @{Num="11"; Folder="py_11_coding_schemas_gh"; Title="Coding Schemas (ASCII and Unicode)"; Topics=@("python", "ascii", "unicode", "character-encoding", "utf8", "text-encoding", "education")},
    @{Num="12"; Folder="py_12_parity_bits_gh"; Title="Parity Bits and Error Detection"; Topics=@("python", "parity", "error-detection", "data-integrity", "communication", "education")},
    @{Num="13"; Folder="py_13_clock_signals_gh"; Title="Clock Signals and Timing"; Topics=@("python", "clock-signals", "frequency", "timing", "digital-circuits", "computer-architecture", "education")},
    @{Num="14"; Folder="py_14_transmission_types_gh"; Title="Transmission Types (Async vs Sync)"; Topics=@("python", "uart", "synchronous", "asynchronous", "communication", "protocols", "education")},
    @{Num="15"; Folder="py_15_transmission_methods_gh"; Title="Transmission Methods (Serial vs Parallel)"; Topics=@("python", "serial", "parallel", "communication", "data-transmission", "computer-architecture", "education")}
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Adding CI/CD Workflows to All Projects" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

$workflowTemplate = Get-Content ".github_workflow_template.yml" -Raw
$releaseTemplate = Get-Content ".github_release_template.yml" -Raw

foreach ($chapter in $chapters) {
    Write-Host "`n--- Processing: $($chapter.Folder) ---" -ForegroundColor Yellow
    
    $folderPath = Join-Path (Get-Location) $chapter.Folder
    
    if (-not (Test-Path $folderPath)) {
        Write-Host "  ERROR: Folder not found!" -ForegroundColor Red
        continue
    }
    
    Push-Location $folderPath
    
    try {
        # Create .github/workflows directory
        $workflowDir = ".github\workflows"
        if (-not (Test-Path $workflowDir)) {
            New-Item -ItemType Directory -Path $workflowDir -Force | Out-Null
            Write-Host "  Created .github/workflows directory" -ForegroundColor Green
        }
        
        # Copy workflow files
        $workflowTemplate | Set-Content "$workflowDir\ci.yml"
        Write-Host "  Added CI workflow" -ForegroundColor Green
        
        $releaseTemplate | Set-Content "$workflowDir\release.yml"
        Write-Host "  Added Release workflow" -ForegroundColor Green
        
        # Add and commit changes
        git add .github/ 2>&1 | Out-Null
        git commit -m "Add CI/CD and release workflows" 2>&1 | Out-Null
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  Committed workflow changes" -ForegroundColor Green
        } else {
            Write-Host "  No changes to commit (workflows may already exist)" -ForegroundColor Gray
        }
        
        # Push changes
        Write-Host "  Pushing to GitHub..." -NoNewline
        git push 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host " DONE" -ForegroundColor Green
        } else {
            Write-Host " FAILED" -ForegroundColor Red
        }
        
    } catch {
        Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    } finally {
        Pop-Location
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Workflow Addition Complete!" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan
