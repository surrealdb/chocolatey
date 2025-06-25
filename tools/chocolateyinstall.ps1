$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '725BEFC5795FC3B8B6D48696399907B83B061229EA1FC9E01470154299202C44'
  checksumType  = 'sha256'
  checksum64    = '725BEFC5795FC3B8B6D48696399907B83B061229EA1FC9E01470154299202C44'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
