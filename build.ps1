$files = Get-ChildItem "src" -Filter chapter*.md

$output = ""

function quots2Chevrons($text) {
    $text -replace '"(.*?)"', '»$1«'
}

function buildMd () {
    $listOfFiles = ".\src\metadata.md "
	
    for ($i = 0; $i -lt $files.Count; $i++) {
        $input = Get-Content $files[$i].FullName
        $output = quots2Chevrons $input
    
        Set-Content .\build\$($files[$i].Name) $output

        $listOfFiles += ".\build\"
        $listOfFiles += $files[$i].Name
        $listOfFiles += " "
    }

    $params = '-s --from=markdown+emoji --to=markdown --atx-headers --preserve-tabs'

    $command = 'pandoc'
    $command += ' '
    $command += $params
    $command += ' '
    $command += $listOfFiles # already has space after it
    $command += '-o build\dafern.md'

    Invoke-Expression $command

    Remove-Item .\build\chapter*.md
}

function buildFromMd($format) {
    $params = '-s -S --from=markdown+emoji --self-contained --atx-headers --normalize --preserve-tabs --reference-location=block'

    if ($format -eq "pdf") {
        $params += ' --template=".\templates\default.tex" .\build\dafern.md -o build\dafern.pdf'
    }
    elseif ($format -eq "html") {
        $params += ' .\build\dafern.md --to=html5 -o build\dafern.html'
    }

    $command = 'pandoc '
    $command += $params
    Invoke-Expression $command
}

buildMd
buildFromMd "pdf"
buildFromMd "html"