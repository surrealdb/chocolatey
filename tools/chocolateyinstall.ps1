$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '4E59FC9377F9139C1A56E10A10A2219BAC08C8A957605F3A0C88B2CC6DDD1675'
  checksumType  = 'sha256'
  checksum64    = '4E59FC9377F9139C1A56E10A10A2219BAC08C8A957605F3A0C88B2CC6DDD1675'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
