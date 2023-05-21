# Put code you'd like to run during dashboard startup here. 
$UDRoot=$PSScriptRoot
New-UDDashboard -Title 'PowerShell Universal' -DefaultTheme Dark -HideUserName -Content {
      # Use Get-UDPage -Name 'Home' to use this page in your dashboard
      $data = Get-PSUCache -Key Videos 
      if (-not $data) {
          $data = import-csv $UDRoot/ConferenceVideos.csv 
          Set-PSUCache -Key Videos -Value $data
      }
      $columns = @(
          New-UDTableColumn -Property Title -IncludeInSearch -ShowSort -ShowFilter -Width 600
          New-UDTableColumn -Property Channel -IncludeInSearch -ShowSort -ShowFilter -FilterType Select -Width 200
          New-UDTableColumn -Property 'Video URL' -title URL -IncludeInSearch -render { New-UDLink -Text URL -url $eventdata.'Video URL' -OpenInNewWindow }
          New-UDTableColumn -Property 'Published Date' -title Published  -IncludeInSearch -ShowSort -ShowFilter -SortType datetime
          New-UDTableColumn -Property Description -Hidden
      )
      New-UDTable -data $data -dense -ShowSort -ShowFilter -ShowExport -Columns $columns -PageSize 12 -ShowPagination -PaginationLocation top -OnRowExpand {
          New-UDDynamic -Content {
              $description=$eventData.Description
              if($description -eq ''){
                  $description='No description provided'
              }
              New-UDTypography -Text $description
          }
      }
}
 #-Pages @(
    # Create a page using the menu to the right ->   
    # Reference the page here with Get-UDPage
    #Get-UDPage -Name Videos 
#)