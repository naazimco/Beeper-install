Write-Host "Downloading Beeper for Windows..."
$installerUrl = "https://api.beeper.com/desktop/download/windows/x64/stable/com.automattic.beeper.desktop"
$outputPath = "$env:USERPROFILE\Downloads\BeeperSetup.exe"
Invoke-WebRequest -Uri $installerUrl -OutFile $outputPath -UseBasicParsing
Write-Host "Installing Beeper..."
Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait -Verb RunAs
Write-Host "Beeper installation completed successfully."
