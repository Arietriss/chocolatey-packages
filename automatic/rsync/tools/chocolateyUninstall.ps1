$id   = "rsync"
$file = "cwRsync_5.4.1_x86_Free.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition

Uninstall-ChocolateyZipPackage -PackageName $id -ZipFileName $file

# Remove the custom shims
Get-ChildItem $tools\*.bat `
  | Split-Path -Leaf `
  | %{ $_ -replace ".bat", ".exe" } `
  | %{ Join-Path $ENV:chocolateyInstall "bin\$_" } `
  | ?{ Test-Path $_ } `
  | Remove-Item -Force
