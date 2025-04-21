$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'CC657593CCCF878B9E349C56175C227F0B589856B68984F96DEF1F7887F9408F'
  checksumType  = 'sha256'
  checksum64    = 'CC657593CCCF878B9E349C56175C227F0B589856B68984F96DEF1F7887F9408F'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
