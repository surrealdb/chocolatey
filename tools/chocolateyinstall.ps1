$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '8D1FF1EBB85E63861FE2D0578DBDB9AD23012AE810526373F3AFD993CA67BB85'
  checksumType  = 'sha256'
  checksum64    = '8D1FF1EBB85E63861FE2D0578DBDB9AD23012AE810526373F3AFD993CA67BB85'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
