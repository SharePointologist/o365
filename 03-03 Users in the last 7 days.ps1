try {
    for ($i=0;;$i+=50) {
        $ExternalUsers += Get-SPOExternalUser -PageSize 50 -Position $i -ea Stop | Where {$_.WhenCreated -gt((get-date).adddays(-7))} 
    }}
catch {}
$ExternalUsers