$servers = Get-Content servercreds.txt

foreach ($line in $servers){
    $splitLine = $line.Split(" ",[StringSplitOptions]'RemoveEmptyEntries')
    putty.exe -ssh pi@$splitLine[0] -pw $splitLine[1]
}
