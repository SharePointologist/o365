New-UnifiedGroup -DisplayName "NACS2018" `
	-Alias "O365Group-NACS2018" `
	-EmailAddresses "NACS2018@globomantics.org" `
	-AccessType Private 

New-UnifiedGroup -DisplayName "NACS2018Private" `
	-Alias "O365Group-NACS2018Private" `
	-EmailAddresses "NACS2018Private@globomantics.org" `
	-AccessType Private `
	-HiddenGroupMembershipEnabled 

Set-UnifiedGroup -Identity "O365Group-NACS2018Private" -HiddenFromAddressListsEnabled $true
