$piDrive = Get-Volume | where {$_.FileSystemLabel -like '*boot*'}

New-Item $piDrive.Path\ssh
