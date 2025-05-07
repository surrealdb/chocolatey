$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '671760E0CFED47D0E7A7C5D71CAA2F043FECF3F61E489CB820023202285D1746'
  checksumType  = 'sha256'
  checksum64    = '671760E0CFED47D0E7A7C5D71CAA2F043FECF3F61E489CB820023202285D1746'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
