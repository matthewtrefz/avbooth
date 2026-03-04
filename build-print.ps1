param(
    [switch]$NoToc
)

$ErrorActionPreference = 'Stop'

$outputDir = Join-Path $PSScriptRoot 'out'
if (-not (Test-Path $outputDir)) {
    New-Item -Path $outputDir -ItemType Directory | Out-Null
}

$inputFile = Join-Path $PSScriptRoot 'md\av-system-guide.md'
$renderFile = $inputFile
$tempFile = $null

if ($NoToc) {
    $tempFile = Join-Path $outputDir 'av-system-guide.notoc.tmp.md'
    $content = Get-Content -Path $inputFile -Raw
    $content = [regex]::Replace($content, '(?ms)<!-- TOC-START -->.*?<!-- TOC-END -->\r?\n?', '')
    Set-Content -Path $tempFile -Value $content -NoNewline
    $renderFile = $tempFile
}

$outputFile = if ($NoToc) {
    Join-Path $outputDir 'av-system-guide-notoc.pdf'
} else {
    Join-Path $outputDir 'av-system-guide.pdf'
}

$pandocArgs = @(
    $renderFile,
    '--standalone',
    '--from', 'markdown',
    '--to', 'pdf',
    '--pdf-engine=xelatex',
    '--metadata', 'title=AV System Operations Guide',
    '--resource-path=md;assets',
    '-V', 'geometry:paperwidth=5.5in,paperheight=8.5in,top=0.45in,bottom=0.65in,left=0.4in,right=0.4in,includefoot',
    '-V', 'fontsize=10pt',
    '-o', $outputFile
)

& pandoc @pandocArgs

if ($tempFile -and (Test-Path $tempFile)) {
    Remove-Item $tempFile -Force
}

Write-Output "Generated: $outputFile"
