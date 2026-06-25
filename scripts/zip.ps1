# Erstellt alexanderengel.de.zip aus dem Inhalt von dist/.
# Die Eintraege verwenden Forward-Slashes (ZIP-Spec-konform), damit sie auf
# jedem Webspace / in jedem Entpacker korrekt als Ordner angelegt werden.
# Der Inhalt liegt auf oberster Ebene (kein dist/-Unterordner) und kann so
# direkt ins Webroot entpackt werden.
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$dist = Join-Path $root 'dist'
$zipPath = Join-Path $root 'alexanderengel.de.zip'

if (-not (Test-Path $dist)) {
  throw "dist/ nicht gefunden - bitte zuerst 'npm run build' ausfuehren."
}
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$base = (Resolve-Path $dist).Path.TrimEnd('\') + '\'
$zip = [System.IO.Compression.ZipFile]::Open(
  $zipPath, [System.IO.Compression.ZipArchiveMode]::Create)
try {
  Get-ChildItem -Path $dist -Recurse -File | ForEach-Object {
    $rel = $_.FullName.Substring($base.Length) -replace '\\', '/'
    $entry = $zip.CreateEntry($rel, [System.IO.Compression.CompressionLevel]::Optimal)
    $entryStream = $entry.Open()
    $fileStream = [System.IO.File]::OpenRead($_.FullName)
    try { $fileStream.CopyTo($entryStream) }
    finally { $fileStream.Dispose(); $entryStream.Dispose() }
  }
}
finally {
  $zip.Dispose()
}

$kb = [int]((Get-Item $zipPath).Length / 1KB)
Write-Output "Erstellt: alexanderengel.de.zip ($kb KB)"
