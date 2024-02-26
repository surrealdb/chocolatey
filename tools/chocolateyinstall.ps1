$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'surreal.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         = $fileLocation

  softwareName  = 'surrealdb*'

  checksum      = '7BC099AC9930E94F733B59DAC380E9ECD2EB3C400AAFF10348E59A94DB67E479'
  checksumType  = 'sha256'
  checksum64    = '7BC099AC9930E94F733B59DAC380E9ECD2EB3C400AAFF10348E59A94DB67E479'
  checksumType64= 'sha256'
}

Install-BinFile -Name 'surreal' -Path $fileLocation
