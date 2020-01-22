
$wifiName =  Read-Host -Prompt 'Input your WiFi name'
$wifiPass =  Read-Host -Prompt 'Input your WiFi passkey'
$piDrive = Get-Volume | where {$_.FileSystemLabel -like '*boot*'}
$wifiFile = Get-Content wpa_supplicant.conf
$replaceString1 = 'ssid=' + [char]34 + $wifiName + [char]34
$replaceString2 = 'psk=' + [char]34 + $wifiPass + [char]34
$wifiReplace = $wifiFile -Replace 'ssid=', $replaceString1
$wifiReplace1 = $wifiReplace -Replace 'psk=', $replaceString2

Set-Content -path $piDrive.Path\wpa_supplicant.conf -value $wifiReplace1

New-Item $piDrive.Path\ssh
