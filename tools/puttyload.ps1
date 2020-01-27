$servers = Get-Content servercreds.txt

foreach ($line in $servers){
    $splitLine = $line.Split(" ",[StringSplitOptions]'RemoveEmptyEntries')
    if (Test-Connection $splitLine[0]){
        putty.exe -ssh pi@$splitLine[0] -pw $splitLine[1]
    }
    Else{
        echo "$splitLine[0] Offline"
    }
}
