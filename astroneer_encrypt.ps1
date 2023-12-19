# PowerShell script to disable Astroneer encryption

$filePath = Join-Path $env:USERPROFILE "AppData\Local\Astro\Saved\Config\WindowsNoEditor\Engine.ini"
$configText = "`n[SystemSettings]`nnet.AllowEncryption=False`n"

try {
    # Check if the file exists
    if (Test-Path $filePath) {
        # Read the contents of the file
        $content = Get-Content $filePath -Raw

        # Check if the configuration is already present
        if ($content -notmatch "net\.AllowEncryption=False") {
            # Append the configuration
            $content += $configText
            Set-Content -Path $filePath -Value $content
            Write-Host "The configuration has been added successfully."
        } else {
            Write-Host "The configuration is already present."
        }
    } else {
        Write-Host "The Engine.ini file does not exist at the specified path."
    }
} catch {
    Write-Host "An error occurred: $_"
}
