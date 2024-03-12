$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'B239EA0BA76A04EC2E9A72E9A6352D10329795646051AD236A168AE13CB4FBAA'
  checksumType  = 'sha256'
  checksum64    = 'B239EA0BA76A04EC2E9A72E9A6352D10329795646051AD236A168AE13CB4FBAA'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
