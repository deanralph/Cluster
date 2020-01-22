
$wifiName =  Read-Host -Prompt 'Input your WiFi name'
$wifiPass =  Read-Host -AsSecureString -Prompt 'Input your WiFi passkey'
$piDrive = Get-Volume | where {$_.FileSystemLabel -like '*boot*'}
$wifiFile = Get-Content wpa_supplicant.conf

New-Item $piDrive.Path\ssh

$wifiFile -Replace 'ssid="', 'ssid="$wifiName"'
$wifiFile -Replace 'psk="', 'psk="$wifiPass"'

Set-Content -path $piDrive.Path\wpa_supplicant.conf -value $wifiFile
