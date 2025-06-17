$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '24DAACD79243F00150445D6E24DAC07D36CEC646061685B7E7AEBCA7768F53D4'
  checksumType  = 'sha256'
  checksum64    = '24DAACD79243F00150445D6E24DAC07D36CEC646061685B7E7AEBCA7768F53D4'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
