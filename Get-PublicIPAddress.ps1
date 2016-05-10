function Get-PublicIPAddress {
    process {       
        # Define URL to get public IP address:
        $url = "https://api.ipify.org/?format=json"
        
        # Define return psobject and get public IP address:
        $returnobject = New-Object -TypeName PSObject
        $returnobject | Add-Member -MemberType NoteProperty -Name Datetime -Value (Get-Date)
        $returnobject | Add-Member -MemberType NoteProperty -Name IP -Value (Invoke-RestMethod -Uri $url).ip -PassThru
    }
}