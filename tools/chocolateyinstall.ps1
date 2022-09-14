$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '3CC3DB5B3E4F0B7794B885F43AF7C7FB05F0EB95BE64B587AC211B1A398738FC'
  checksumType  = 'sha256'
  checksum64    = '3CC3DB5B3E4F0B7794B885F43AF7C7FB05F0EB95BE64B587AC211B1A398738FC'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
