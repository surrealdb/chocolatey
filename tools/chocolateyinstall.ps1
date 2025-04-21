$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'C43025D876307B1D524AEA8641D3B34D6053FBF9DF585C6F26E3EC4D880069CB'
  checksumType  = 'sha256'
  checksum64    = 'C43025D876307B1D524AEA8641D3B34D6053FBF9DF585C6F26E3EC4D880069CB'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
