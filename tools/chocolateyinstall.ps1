$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '99B2068B3272A39DCFF6C4F979157AD77F98EAA1383E9612CCE317A7A1A9EF20'
  checksumType  = 'sha256'
  checksum64    = '99B2068B3272A39DCFF6C4F979157AD77F98EAA1383E9612CCE317A7A1A9EF20'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
