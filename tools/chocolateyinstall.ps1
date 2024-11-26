$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '7BCEE32D5004B6998993269DB627E451EB4F12C4154CDBC5F3E1EAFCBE6F8045'
  checksumType  = 'sha256'
  checksum64    = '7BCEE32D5004B6998993269DB627E451EB4F12C4154CDBC5F3E1EAFCBE6F8045'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
