$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '5003453AA7772ED894D69A04D77091CBAC0739559E0945EFF9745F8F989F63E7'
  checksumType  = 'sha256'
  checksum64    = '5003453AA7772ED894D69A04D77091CBAC0739559E0945EFF9745F8F989F63E7'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
