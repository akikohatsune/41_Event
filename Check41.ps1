
pushd $PSScriptRoot
$result = $true
$errmessage = ""
$eventId = 41
$logName = "System"
$events = Get-WinEvent -LogName $logName | Where-Object { $_.Id -eq $eventId }

if ($events) {
    foreach ($event in $events) {
        $result = $result -and $false
        Write-Host "Event ID: $($event.Id)"
        Write-Host "Time Created: $($event.TimeCreated)"
        Write-Host "Message: $($event.Message)"
    }
} 
else {
    Write-Host 'No events with ID $eventId found in the $logName log.'
}


#Check if there's eventlog about going to CS mode
if($result){
    Write-Output "No 41 events"
    cmd.exe /c color 27
}
else{
    cmd.exe /c color 47
}