$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '4B767ABBAB2DF67B2396CF07B27641ED2EF3AB5EF2A529C5552E165C8A0B5E3F'
  checksumType  = 'sha256'
  checksum64    = '4B767ABBAB2DF67B2396CF07B27641ED2EF3AB5EF2A529C5552E165C8A0B5E3F'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
