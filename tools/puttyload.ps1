$servers = Get-Content servercreds.txt
$os = Get-ChildItem -path env:OS

foreach ($line in $servers){

    $splitLine = $line.Split(" ",[StringSplitOptions]'RemoveEmptyEntries')
    $serverAdder = $splitLine[0]
    $serverPW = $splitLine[1]
    
    if (Test-Connection $serverAdder){
        if($os.Value -contains "Windows_NT"){
            putty.exe -ssh pi@$serverAdder -pw $serverPW
        }
        Else{
            putty -ssh pi@$serverAdder -pw $serverPW
        }
    }
    Else{
        echo "$serverAdder Offline"
    }
}
