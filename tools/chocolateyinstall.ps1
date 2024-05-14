$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '31123325D9035877A4A085F473E35D3774E2C82AECAA29DAFDAB16BC1D0DD670'
  checksumType  = 'sha256'
  checksum64    = '31123325D9035877A4A085F473E35D3774E2C82AECAA29DAFDAB16BC1D0DD670'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
