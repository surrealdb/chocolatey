$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'F0609584F66C15DEBC59CFA1E6B6F8502FF49C647E13A54FC6DCB3F39517A63F'
  checksumType  = 'sha256'
  checksum64    = 'F0609584F66C15DEBC59CFA1E6B6F8502FF49C647E13A54FC6DCB3F39517A63F'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
