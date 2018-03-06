$SiteCollections  = Get-SPOSite -Limit All
foreach ($site in $SiteCollections)
{
	if ($site.url -NotLike "*personal*")
	{
	$ExternalUsers += Get-SPOUser -Limit All -Site $site.Url | Where {$_.LoginName -like "*urn:spo:guest*" -or $_.LoginName -like "*#ext#*"} | Select DisplayName,LoginName,@{Name = "Url" ; Expression = { $site.url } }
	}
}

$ExternalUsers | Export-Csv -Path "ExternalUsersPerSCWithModern.csv" -NoTypeInformation
