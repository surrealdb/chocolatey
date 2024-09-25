$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'D0A5C613331763B4AAB8CFDAD72236A38619A897DB83460B0387C88DEC06ADA4'
  checksumType  = 'sha256'
  checksum64    = 'D0A5C613331763B4AAB8CFDAD72236A38619A897DB83460B0387C88DEC06ADA4'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
