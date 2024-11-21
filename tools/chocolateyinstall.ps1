$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '7F09401AC7196782CE7A1A2DDF6F5C8530319712BDF3ECD4EBAA9A22094233EB'
  checksumType  = 'sha256'
  checksum64    = '7F09401AC7196782CE7A1A2DDF6F5C8530319712BDF3ECD4EBAA9A22094233EB'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
