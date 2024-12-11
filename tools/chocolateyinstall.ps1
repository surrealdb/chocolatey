$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'C599ECCA6742A7494B1C4EE3DBD863153B4422B52F9368736748B0A584E5DBF1'
  checksumType  = 'sha256'
  checksum64    = 'C599ECCA6742A7494B1C4EE3DBD863153B4422B52F9368736748B0A584E5DBF1'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
