$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '6942B12C30F1A48D5DCE578C1B0D2E489BF817C0F9863AE7F9AEBE6E41CFA7AB'
  checksumType  = 'sha256'
  checksum64    = '6942B12C30F1A48D5DCE578C1B0D2E489BF817C0F9863AE7F9AEBE6E41CFA7AB'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
