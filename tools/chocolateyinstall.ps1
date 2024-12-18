$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'FAE77E8D95568EE6A29DBF054808A54DC2C59CF8F928537DD1E85CC79E6E389B'
  checksumType  = 'sha256'
  checksum64    = 'FAE77E8D95568EE6A29DBF054808A54DC2C59CF8F928537DD1E85CC79E6E389B'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
