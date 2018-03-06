$Office365Groups = Get-UnifiedGroup
foreach ($Group in $Office365Groups)
{
	$Logs = $null
	$SPSite = $group.SharePointSiteUrl
	$SPLib = $group.SharePointDocumentsUrl
	$Logs = Search-UnifiedAuditLog -StartDate ((get-date).adddays(-90)) -EndDate (Get-Date) -ObjectId $SPSite 
	$Logs += Search-UnifiedAuditLog -StartDate ((get-date).adddays(-90)) -EndDate (Get-Date) -ObjectId $SPLib
	$Mailbox = Get-MailboxFolderStatistics -Identity $Group.Alias -IncludeOldestAndNewestITems -FolderScope Inbox
	$LastConversation = $Mailbox.NewestItemReceivedDate

	if ($Logs -or $LastConversation -gt ((get-date).adddays(-90)))
	{
		Write-Host "The following Group" $Group.Alias " Is Still Active" -ForegroundColor Green
	}
	else
	{
		Write-Host "The following Group" $Group.Alias " SharePoint Site or Mailbox haven't been used in the last 90 days" -ForegroundColor Magenta
	}
}

