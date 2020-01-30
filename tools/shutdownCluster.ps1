$servers = Get-Content servercreds.txt
$splitLine = $line.Split(" ",[StringSplitOptions]'RemoveEmptyEntries')
$serverAdder = $splitLine[0]
$serverPW = $splitLine[1]
$os = Get-ChildItem -path env:OS

foreach ($line in $servers){
    
    if (Test-Connection $serverAdder){
        if($os.Value -contains "Windows_NT"){
            plink.exe -ssh pi@$serverAdder -pw $serverPW sudo poweroff
            echo "Powering off"
        }
        Else{
            plink -ssh pi@$serverAdder -pw $serverPW sudo poweroff
        }
    }
    Else{
        echo "$serverAdder already offline"
    }
}
