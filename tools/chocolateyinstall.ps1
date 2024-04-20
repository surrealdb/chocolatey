$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'FDB0468CE75295F3F73FCE12B15DF838AC85C17C67D5CDE13C6997C9D1F4F5D5'
  checksumType  = 'sha256'
  checksum64    = 'FDB0468CE75295F3F73FCE12B15DF838AC85C17C67D5CDE13C6997C9D1F4F5D5'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
