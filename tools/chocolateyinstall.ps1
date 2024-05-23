$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '49E33D8607D6A402B5CB8064FDD5399178F0E462F1513DE454929A0C979AB910'
  checksumType  = 'sha256'
  checksum64    = '49E33D8607D6A402B5CB8064FDD5399178F0E462F1513DE454929A0C979AB910'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
