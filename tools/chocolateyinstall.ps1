$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '9B5C378737F90AEF2DB7628DB20436AC26481890D0A2B4835176337C06A74613'
  checksumType  = 'sha256'
  checksum64    = '9B5C378737F90AEF2DB7628DB20436AC26481890D0A2B4835176337C06A74613'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
