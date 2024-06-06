$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '6753D36E9394EDFE3EDE5F4B2CE77DE842ED1688D087234731D6EBEA4CD4D819'
  checksumType  = 'sha256'
  checksum64    = '6753D36E9394EDFE3EDE5F4B2CE77DE842ED1688D087234731D6EBEA4CD4D819'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
