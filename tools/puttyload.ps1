$servers = Get-Content servercreds.txt

foreach ($line in $servers){
  putty.exe -ssh $ine
}
