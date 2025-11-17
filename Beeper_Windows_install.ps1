Write-Host "Fetching latest Beeper download URL..." -ForegroundColor Cyan
$installerUrl = "https://api.beeper.com/desktop/download/windows/x64/stable/com.automattic.beeper.desktop"

try {
    $response = Invoke-WebRequest -Uri $installerUrl -Method Head -Headers @{"User-Agent"="Mozilla/5.0"} -ErrorAction Stop
    $finalUrl = $response.BaseResponse.ResponseUri.AbsoluteUri
}
catch {
    Write-Host "Error: Failed to retrieve the final download link." -ForegroundColor Red
    exit 1
}

$downloadDir = Join-Path $env:USERPROFILE "Downloads"

if (!(Test-Path $downloadDir)) {
    Write-Host "Your Downloads folder is missing or moved." -ForegroundColor Yellow
    $downloadDir = Read-Host "Enter the correct Downloads folder path"

    if (!(Test-Path $downloadDir)) {
        Write-Host "Error: The specified path does not exist." -ForegroundColor Red
        exit 1
    }
}

$outputPath = Join-Path $downloadDir "BeeperSetup.exe"

Write-Host "`nDownloading Beeper installer..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $finalUrl -OutFile $outputPath -ErrorAction Stop
}
catch {
    Write-Host "Error: Failed to download the Beeper installer." -ForegroundColor Red
    exit 1
}

if (!(Test-Path $outputPath)) {
    Write-Host "Error: Downloaded file is missing." -ForegroundColor Red
    exit 1
}

$fileInfo = Get-Item $outputPath
if ($fileInfo.Length -lt 5MB) {
    Write-Host "Warning: The downloaded file appears unusually small." -ForegroundColor Yellow
    Write-Host "Installation may fail. Aborting for safety." -ForegroundColor Yellow
    exit 1
}

Write-Host "`nInstalling Beeper..." -ForegroundColor Cyan

try {
    Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait -Verb RunAs
}
catch {
    Write-Host "Installation failed to start." -ForegroundColor Red
    exit 1
}

Write-Host "`nBeeper installation completed successfully!" -ForegroundColor Green
Remove-Item $outputPath -Force
Write-Host "Installer removed from Downloads."
