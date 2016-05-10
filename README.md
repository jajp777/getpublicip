# Get-PublicIPAddress (@daniel0x00)
Get public IP address, optional iterate, delay and outfile parameters.

## Install

Open PowerShell console and paste:

`iex(new-object system.net.webclient).downloadstring('https://raw.githubusercontent.com/daniel0x00/getpublicip/master/Get-PublicIPAddress.ps1')`

## Usage

```
PS C:\> Get-PublicIPAddress
        
        DateTime            IP
        --------            --
        10/05/2016 12:49:21 90.174.2.21
``` 

```
PS C:\> (Get-PublicIPAddress).IP
        
        90.174.2.21
``` 

```
PS C:\> Get-PublicIPAddress -Iterate 3
        
        DateTime            IP
        --------            --
        10/05/2016 12:50:32 90.174.2.21
        10/05/2016 12:50:37 90.174.2.21
        10/05/2016 12:50:42 90.174.2.21
``` 

```
PS C:\> Get-PublicIPAddress -Iterate 3 -Delay 300 -OutFile PublicIPAddress.txt
        
        Write a txt with 3 iterations of Get-PublicIPAddress, with 5 mins of delay for each request.
``` 