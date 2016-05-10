function Get-PublicIPAddress {
    <#
    
    .SYNOPSIS
        This function obtains your public IP address. Optionally you can configure how many iterations you want, 
        delay between iterations and redirect the output to a file.
    .PARAMETER Iterate
        Optional. How many times you want to run the function. Default = 1.
    .PARAMETER Delay
        Optional. Delay in seconds for each iteration. Default to 5 segs.
    .PARAMETER OutFile
        Optional. Path to file to redirect the output for each iteration.
    .OUTPUTS
        PSObject with DateTime and public IP address.
    .EXAMPLE
        PS C:\> Get-PublicIPAddress
        
        DateTime            IP
        --------            --
        10/05/2016 12:49:21 90.174.2.21
        
    .EXAMPLE
        PS C:\> Get-PublicIPAddress -Iterate 3
        
        DateTime            IP
        --------            --
        10/05/2016 12:50:32 90.174.2.21
        10/05/2016 12:50:37 90.174.2.21
        10/05/2016 12:50:42 90.174.2.21
        
    .EXAMPLE
        PS C:\> Get-PublicIPAddress -Iterate 3 -Delay 300 -OutFile PublicIPAddress.txt
        
        Write a txt with 3 iterations of Get-PublicIPAddress, with 5 mins of delay for each request.
    
    #>
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
            $out | Add-Member -MemberType NoteProperty -Name DateTime -Value (Get-Date)
            $out | Add-Member -MemberType NoteProperty -Name IP -Value (Invoke-RestMethod -Uri $url).ip 
            if ($OutFile) { $out | Out-File -Append -FilePath $OutFile }
            else { $out }
            
            if ($Iterate -gt 1 -and $counter -lt $Iterate) { Start-Sleep -Seconds $Delay }
        } while ($counter -lt $Iterate)
    }
}