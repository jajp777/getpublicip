function Get-PublicIPAddress {
    process {
        $returnobject = @{ Ip = $null }

        New-Object -Property $returnobject -TypeName psobject
    }
}