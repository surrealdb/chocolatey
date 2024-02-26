#!/usr/bin/env pwsh
# Copyright (C) 2022 - ProhetLamb
# Copyright (C) 2024 - tobiemh
# Downloads the current surreal binary and patches the choco package information.

$version = $env:SURREALDB_VERSION

## --------------------------------------------------
## Download the current binary and checksum
## --------------------------------------------------

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$baseurl='https://download.surrealdb.com'
$arch="windows-amd64"
$bin="tools/surreal.exe"
$url="$baseurl/$version/surreal-$version.$arch.exe"
$chk="$baseurl/$version/surreal-$version.$arch.txt"

echo "Downloading $url to $bin"
Invoke-WebRequest $url -UseBasicParsing -OutFile $bin

echo "Fetching $chk checksum"
$checksum = checksum -t sha256 -f $bin

## --------------------------------------------------
## Update the binary version in the version file
## --------------------------------------------------

echo "Updating version in current.version to $version"

Write-Output $version | out-file -encoding utf8 "current.version"

## --------------------------------------------------
## Patch the checksum in the powershell scripts
## --------------------------------------------------

echo "Patching checksums in tools/*.ps1 to $checksum"

$expr='^(\s*checksum\d*\s*=\s*).*'
$replace='$1'+"'$checksum'"

foreach($file in gci "tools/*.ps1") {
  [array]$content = Get-Content $file
  for($i = 0; $i -lt $content.Count; $i++) {
    $content[$i] = $content[$i] -replace $expr, $replace
  }
  Set-Content $file $content
}

## --------------------------------------------------
## Update the package version in the nuspec file
## --------------------------------------------------

$version = $version -replace '^v(\d+\.\d+\.\d+)$', '$1'

echo "Patching version in surreal.nuspec to $version"

$file='surreal.nuspec'
$expr='<version>\d+\.\d+\.\d+(?:-\w+\d*)?</version>'
$replace="<version>$version</version>"

[array]$content = Get-Content $file
for($i = 0; $i -lt $content.Count; $i++) {
  $content[$i] = $content[$i] -replace $expr, $replace
}
Set-Content $file $content

## --------------------------------------------------
## All complete
## --------------------------------------------------

echo "Done"
