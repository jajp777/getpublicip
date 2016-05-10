function Get-PublicIPAddress {
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$false)]
        [Int]
        $Iterate = 1,
        
        [Parameter(Mandatory=$false)]
        [Int]
        $Delay = 5,
        
        [Parameter(Mandatory=$false)]
        [String]
        $OutFile
    )
    process {       
        # Define URL to get public IP address:
        $url = "https://api.ipify.org/?format=json"
        
        $counter = 0
        do {
            $counter++
            
            $out = New-Object -TypeName PSObject
            $out | Add-Member -MemberType NoteProperty -Name Datetime -Value (Get-Date)
            $out | Add-Member -MemberType NoteProperty -Name IP -Value (Invoke-RestMethod -Uri $url).ip 
            if ($OutFile) { $out | Out-File -Append -FilePath $OutFile }
            else { $out }
            
            if ($Iterate -gt 1 -and $counter -lt $Iterate) { Start-Sleep -Seconds $Delay }
        } while ($counter -lt $Iterate)
    }
}