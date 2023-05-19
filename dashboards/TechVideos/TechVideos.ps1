# Put code you'd like to run during dashboard startup here. 
$UDRoot=$PSScriptRoot
New-UDDashboard -Title 'PowerShell Universal' -Pages @(
    # Create a page using the menu to the right ->   
    # Reference the page here with Get-UDPage
    Get-UDPage -Name Home
)