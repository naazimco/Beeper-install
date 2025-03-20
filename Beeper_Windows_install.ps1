Write-Host "Fetching latest Beeper download URL..."
$installerUrl = "https://api.beeper.com/desktop/download/windows/x64/stable/com.automattic.beeper.desktop"
$finalUrl = (Invoke-WebRequest -Uri $installerUrl -MaximumRedirection 0 -ErrorAction SilentlyContinue).Headers.Location

if (-not $finalUrl) {
    Write-Host "Error: Failed to retrieve the final download link."
    exit 1
}

Write-Host "Downloading Beeper for Windows..."
$outputPath = "$env:USERPROFILE\Downloads\BeeperSetup.exe"
Invoke-WebRequest -Uri $finalUrl -OutFile $outputPath -UseBasicParsing

Write-Host "Installing Beeper..."
Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait -Verb RunAs

Write-Host "Beeper installation completed successfully."
