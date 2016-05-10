function Get-PublicIPAddress {
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$false)]
        [Int]
        $Iterate = 1,
        
        [Parameter(Mandatory=$false)]
        [Int]
        $Delay = 5
    )
    process {       
        # Define URL to get public IP address:
        $url = "https://api.ipify.org/?format=json"
        
        # Define return psobject and get public IP address:
        $counter = 0
        do {
            $counter++
            $returnobject = New-Object -TypeName PSObject
            $returnobject | Add-Member -MemberType NoteProperty -Name Datetime -Value (Get-Date)
            $returnobject | Add-Member -MemberType NoteProperty -Name IP -Value (Invoke-RestMethod -Uri $url).ip -PassThru
            if ($Iterate -gt 1) { Start-Sleep -Seconds $Delay }
        } while ($counter -lt $Iterate)
    }
}