Write-Host "Fetching latest Beeper download URL..."
$installerUrl = "https://api.beeper.com/desktop/download/windows/x64/stable/com.automattic.beeper.desktop"

# Send a request to get the redirected URL
try {
    $response = Invoke-WebRequest -Uri $installerUrl -MaximumRedirection 0 -ErrorAction Stop
} catch {
    if ($_.Exception.Response -and $_.Exception.Response.Headers["Location"]) {
        $finalUrl = $_.Exception.Response.Headers["Location"]
    } else {
        Write-Host "Error: Failed to retrieve the final download link."
        exit 1
    }
}

Write-Host "Final Beeper download URL: $finalUrl"

# Define output path
$outputPath = "$env:USERPROFILE\Downloads\BeeperSetup.exe"

Write-Host "Downloading Beeper for Windows..."
Invoke-WebRequest -Uri $finalUrl -OutFile $outputPath -UseBasicParsing

Write-Host "Installing Beeper..."
Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait -Verb RunAs

Write-Host "Beeper installation completed successfully."
