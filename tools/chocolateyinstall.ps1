$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'E25BA96A04988E1262373AE8DBBDA819C1272634B1F4AEA4E68494C80638A6FF'
  checksumType  = 'sha256'
  checksum64    = 'E25BA96A04988E1262373AE8DBBDA819C1272634B1F4AEA4E68494C80638A6FF'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
