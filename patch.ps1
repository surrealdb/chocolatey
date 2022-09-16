#!/usr/bin/env pwsh
# Copyright (C) 2022 - ProhetLamb
# Downloads the current surreal binary and patches the choco package information.

$toolsdir = './tools'
$version= $env:SURREALDB_VERSION

##
# download the current binary
##

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$baseurl='https://download.surrealdb.com'
$arch="windows-amd64"
$bin="$toolsdir/surreal.exe"
$url="$baseurl/$version/surreal-$version.$arch.exe"

echo "Downloading $url to $bin"
# https://download.surrealdb.com/v1.0.0-beta.7/surreal-v1.0.0-beta.7.windows-amd64.exe
Invoke-WebRequest $url -UseBasicParsing -OutFile $bin

$checksum=checksum -t sha256 -f $bin

##
# patch checksum and checksum64 for the binary in powershell scripts
##

# replaces the value of the following with $checksum
#   checksum      =
#   checksum64    = 'wegwerghwrgh'
echo "Patching checksums in $toolsDir/*.ps1 to $checksum"
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
# update current.version
##

echo $version > current.version

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
echo "Patching version in surreal.nuspec to $version"
$expr='<version>\d+\.\d+\.\d+(?:-\w+\d*)?</version>'
$replace="<version>$version</version>"

$file='surreal.nuspec'
[array]$content = Get-Content $file
for($i = 0; $i -lt $content.Count; $i++) {
  $content[$i] = $content[$i] -replace $expr, $replace
}
Set-Content $file $content
echo "Done"
