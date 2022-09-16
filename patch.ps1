#!/usr/bin/env pwsh
# Copyright (C) 2022 - ProhetLamb
# Downloads the current surreal binary and patches the choco package information.

$toolsdir = './tools'

##
# download the current binary
##


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls13
$baseurl='https://download.surrealdb.com'
$version= $env:SURREALDB_VERSION ?? (Invoke-WebRequest 'https://version.surrealdb.com' -UseBasicParsing).Content.trim()
$arch="windows-amd64"
$bin="$toolsdir/surreal.exe"

# https://download.surrealdb.com/v1.0.0-beta.7/surreal-v1.0.0-beta.7.windows-amd64.exe
Invoke-WebRequest "$baseurl/$version/surreal-$version.$arch.exe" -UseBasicParsing -OutFile $bin

$checksum=checksum -t sha256 -f $bin

##
# patch checksum and checksum64 for the binary in powershell scripts
##

# replaces the value of the following with $checksum
#   checksum      =
#   checksum64    = 'wegwerghwrgh'
$expr='^(\s*checksum\d*\s*=\s*).*'
$replace='$1'+"'$checksum'"

foreach($file in gci "$toolsDir/*.ps1") {
  [array]$content = Get-Content $file
  for($i = 0; $i -lt $content.Count; $i++) {
    $content[$i] = $content[$i] -replace $expr, $replace
  }
  Set-Content $file $content
}


##
# update version for surrealdb.nuspec
##

# patch beta version string to conform with
# https://docs.microsoft.com/en-us/nuget/concepts/package-versioning#creating-prerelease-packages
# rplacesing v1.0.0-beta.7 with 1.0.0-beta7
$version = $version -replace '^v(\d+\.\d+\.\d+)-beta\.(\d+)$', '$1-beta$2'

# replaces the following
#    <version>1.0.0</version>
#    <version>1.0.0-beta5</version>
$expr='<version>\d+\.\d+\.\d+(?:-\w+\d*)?</version>'
$replace="<version>$version</version>"

$file='surrealdb.nuspec'
[array]$content = Get-Content $file
for($i = 0; $i -lt $content.Count; $i++) {
  $content[$i] = $content[$i] -replace $expr, $replace
}
Set-Content $file $content
