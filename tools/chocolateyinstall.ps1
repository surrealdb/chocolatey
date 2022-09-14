$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$baseurl='https://download.surrealdb.com'
$version=(Invoke-WebRequest 'https://version.surrealdb.com' -UseBasicParsing).Content.trim()
$arch="windows-amd64"

$url        = "$baseurl/$version/surreal-$version.$arch.exe"
$url64      = $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'surrealdb*'

  checksum      = '294F85AE4995BD40DAC79D83AE4C5A62FEF879CC5C797D310E63E76101B8F0E5'
  checksumType  = 'sha256'
  checksum64    = '294F85AE4995BD40DAC79D83AE4C5A62FEF879CC5C797D310E63E76101B8F0E5'
  checksumType64= 'sha256'
  silentArgs   = ''
  validExitCodes = 0
}

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile $packageName "$toolsDir/surreal.exe" $url $url64
Install-BinFile -Name 'surreal' "$toolsDir/surreal.exe"
