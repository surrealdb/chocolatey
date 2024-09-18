$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '83A18E33CDE28EB4965207921019E5B7CF6B1DB6ED665C00B11257806763362B'
  checksumType  = 'sha256'
  checksum64    = '83A18E33CDE28EB4965207921019E5B7CF6B1DB6ED665C00B11257806763362B'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
