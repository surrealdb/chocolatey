$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '36A24B55F184DE184A633444817A446D346771262D787547AFA0F941A4BEAB15'
  checksumType  = 'sha256'
  checksum64    = '36A24B55F184DE184A633444817A446D346771262D787547AFA0F941A4BEAB15'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
