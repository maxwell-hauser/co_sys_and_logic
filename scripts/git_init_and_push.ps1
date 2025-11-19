# Git initialization and GitHub repository creation script
# Initializes each chapter folder as a separate Git repository and pushes to GitHub

$chapters = @(
    @{Num="01"; Folder="py_01_signal_and_num_sys_gh"; RepoName="py_01_signal_and_num_sys_gh"},
    @{Num="02"; Folder="py_02_analog_signals_gh"; RepoName="py_02_analog_signals_gh"},
    @{Num="03"; Folder="py_03_digital_signals_gh"; RepoName="py_03_digital_signals_gh"},
    @{Num="04"; Folder="py_04_number_systems_gh"; RepoName="py_04_number_systems_gh"},
    @{Num="05"; Folder="py_05_conversions_gh"; RepoName="py_05_conversions_gh"},
    @{Num="06"; Folder="py_06_complements_gh"; RepoName="py_06_complements_gh"},
    @{Num="07"; Folder="py_07_signed_magnitude_gh"; RepoName="py_07_signed_magnitude_gh"},
    @{Num="08"; Folder="py_08_binary_addition_subtraction_gh"; RepoName="py_08_binary_addition_subtraction_gh"},
    @{Num="09"; Folder="py_09_floating_point_representation_gh"; RepoName="py_09_floating_point_representation_gh"},
    @{Num="10"; Folder="py_10_binary_coded_decimals_gh"; RepoName="py_10_binary_coded_decimals_gh"},
    @{Num="11"; Folder="py_11_coding_schemas_gh"; RepoName="py_11_coding_schemas_gh"},
    @{Num="12"; Folder="py_12_parity_bits_gh"; RepoName="py_12_parity_bits_gh"},
    @{Num="13"; Folder="py_13_clock_signals_gh"; RepoName="py_13_clock_signals_gh"},
    @{Num="14"; Folder="py_14_transmission_types_gh"; RepoName="py_14_transmission_types_gh"},
    @{Num="15"; Folder="py_15_transmission_methods_gh"; RepoName="py_15_transmission_methods_gh"}
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Git Initialization and GitHub Push" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# Get GitHub username (you can hardcode this if needed)
$githubUsername = Read-Host "Enter your GitHub username"

foreach ($chapter in $chapters) {
    Write-Host "`n--- Processing Chapter $($chapter.Num): $($chapter.Folder) ---" -ForegroundColor Yellow
    
    $folderPath = Join-Path (Get-Location) $chapter.Folder
    
    if (-not (Test-Path $folderPath)) {
        Write-Host "  ERROR: Folder not found!" -ForegroundColor Red
        continue
    }
    
    # Change to chapter directory
    Push-Location $folderPath
    
    try {
        # Initialize Git repository
        Write-Host "  1. Initializing Git repository..." -NoNewline
        git init | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host " DONE" -ForegroundColor Green
        } else {
            Write-Host " FAILED" -ForegroundColor Red
            Pop-Location
            continue
        }
        
        # Add all files
        Write-Host "  2. Adding files to Git..." -NoNewline
        git add . | Out-Null
        Write-Host " DONE" -ForegroundColor Green
        
        # Commit
        Write-Host "  3. Creating initial commit..." -NoNewline
        git commit -m "Initial commit: Computer Systems and Logic Chapter $($chapter.Num)" | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host " DONE" -ForegroundColor Green
        } else {
            Write-Host " FAILED" -ForegroundColor Red
            Pop-Location
            continue
        }
        
        # Create GitHub repository using gh CLI
        Write-Host "  4. Creating GitHub repository..." -NoNewline
        $repoUrl = "https://github.com/$githubUsername/$($chapter.RepoName)"
        gh repo create $chapter.RepoName --public --source=. --remote=origin --description="Computer Systems and Logic - Chapter $($chapter.Num)" 2>&1 | Out-Null
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host " DONE" -ForegroundColor Green
        } else {
            Write-Host " FAILED (may already exist)" -ForegroundColor Yellow
            # Try to add remote manually
            git remote add origin "https://github.com/$githubUsername/$($chapter.RepoName).git" 2>&1 | Out-Null
        }
        
        # Set default branch to main
        Write-Host "  5. Setting default branch to main..." -NoNewline
        git branch -M main | Out-Null
        Write-Host " DONE" -ForegroundColor Green
        
        # Push to GitHub
        Write-Host "  6. Pushing to GitHub..." -NoNewline
        git push -u origin main 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host " DONE" -ForegroundColor Green
            Write-Host "  Repository URL: $repoUrl" -ForegroundColor Cyan
        } else {
            Write-Host " FAILED" -ForegroundColor Red
        }
        
    } catch {
        Write-Host " ERROR: $($_.Exception.Message)" -ForegroundColor Red
    } finally {
        # Return to parent directory
        Pop-Location
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Process Complete!" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan
