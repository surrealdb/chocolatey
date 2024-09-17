$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '956D888B60F861098D26262B0B0708F23CCA616E4BBC4C820F715282B8FF2936'
  checksumType  = 'sha256'
  checksum64    = '956D888B60F861098D26262B0B0708F23CCA616E4BBC4C820F715282B8FF2936'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
