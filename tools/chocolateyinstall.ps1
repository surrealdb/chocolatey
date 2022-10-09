$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'D32DE1BBBFE545D7D51DF425C4C50E636AE88F034FF1ED4A7AB2CD09BD0CFEA4'
  checksumType  = 'sha256'
  checksum64    = 'D32DE1BBBFE545D7D51DF425C4C50E636AE88F034FF1ED4A7AB2CD09BD0CFEA4'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
