Write-Host "Fetching latest Beeper download URL..."
$installerUrl = "https://api.beeper.com/desktop/download/windows/x64/stable/com.automattic.beeper.desktop"
try {
    $response = Invoke-WebRequest -Uri $installerUrl -Method Head -Headers @{"User-Agent"="Mozilla/5.0"} -ErrorAction Stop
    $finalUrl = $response.BaseResponse.ResponseUri.AbsoluteUri
} catch {
    Write-Host "Error: Failed to retrieve the final download link."
    exit 1
}

$downloadDir = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("UserProfile"), "Downloads")
if (!(Test-Path -Path $downloadDir)) {
    Write-Host "Your Downloads folder is missing or moved. Please enter the correct path:"
    $downloadDir = Read-Host "Enter your Downloads folder path"
    if (!(Test-Path -Path $downloadDir)) {
        Write-Host "Error: The specified path does not exist."
        exit 1
    }
}

$outputPath = "$downloadDir\BeeperSetup.exe"

Write-Host "Downloading Beeper for Windows to: $outputPath"
Invoke-WebRequest -Uri $finalUrl -OutFile $outputPath -UseBasicParsing

Write-Host "Installing Beeper..."
Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait -Verb RunAs

Write-Host "Beeper installation completed successfully."
