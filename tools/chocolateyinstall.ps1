$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'D9F1AD7614F372E5327DD38C6DADBCFE00B8AA36EFE959DE9D0290740DCB1AE3'
  checksumType  = 'sha256'
  checksum64    = 'D9F1AD7614F372E5327DD38C6DADBCFE00B8AA36EFE959DE9D0290740DCB1AE3'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
