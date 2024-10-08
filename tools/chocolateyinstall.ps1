$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = 'C5416FF129E76A3626C0EBCEFC30F384073CB843C69C479186B34B876486B574'
  checksumType  = 'sha256'
  checksum64    = 'C5416FF129E76A3626C0EBCEFC30F384073CB843C69C479186B34B876486B574'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
