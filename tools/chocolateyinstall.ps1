$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'D41A16F5FBCB00E0C79F28C6B5F019538D3760F2BCADBE3BA31F69E7F8E257A8'
  checksumType  = 'sha256'
  checksum64    = 'D41A16F5FBCB00E0C79F28C6B5F019538D3760F2BCADBE3BA31F69E7F8E257A8'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
