$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '3859D2BD03ED33F1082C240D4C957CA7A2D7BF96187E39A81F97CD495840EBA7'
  checksumType  = 'sha256'
  checksum64    = '3859D2BD03ED33F1082C240D4C957CA7A2D7BF96187E39A81F97CD495840EBA7'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
