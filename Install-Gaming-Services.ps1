$principal = New-Object Security.Principal.WindowsPrincipal(
    [Security.Principal.WindowsIdentity]::GetCurrent()
)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process -FilePath "powershell.exe" `
        -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" `
        -Verb RunAs
    exit
}

Get-AppxPackage Microsoft.GamingServices
Get-AppxPackage Microsoft.GamingServices | Remove-AppxPackage -AllUsers
Start-Process "ms-windows-store://pdp/?productid=9MWPM2CQNLHN"