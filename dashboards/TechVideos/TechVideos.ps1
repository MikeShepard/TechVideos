# Put code you'd like to run during dashboard startup here. 
$UDRoot=$PSScriptRoot
New-UDDashboard -Title 'PowerShell Universal' -DefaultTheme Dark -HideUserName -Pages @(
    # Create a page using the menu to the right ->   
    # Reference the page here with Get-UDPage
    Get-UDPage -Name Videos 
)