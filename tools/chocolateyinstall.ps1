$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '8348962B0362401EE1CAD742875B86CF5C38AB5E877B8DA6F967887B7EAD36A2'
  checksumType  = 'sha256'
  checksum64    = '8348962B0362401EE1CAD742875B86CF5C38AB5E877B8DA6F967887B7EAD36A2'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
