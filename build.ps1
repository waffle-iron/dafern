param(
	[switch]$nopdf = $false,
	[switch]$nohtml = $false,
	[switch][alias("d")]$debug = $false
)



$files = Get-ChildItem "src" -Filter chapter*.md

$output = ""

if (!$debug) {
	$params = '--quiet '
}
else {
	$params = ''
}

function quots2Chevrons($text) {
	$text -replace '"(.*?)"', '»$1«'
}

function buildMd ($type) {

	if ($type -eq "first") {
		$params += '-s '

		$listOfFiles = ".\src\metadata.md "
	}
	else {
		$listOfFiles = ".\build\metadata.md "
		$params += ''

		$title = "# Dafern"

		$metadata = Get-Content .\src\metadata.md

		$newMetadata1 = $title

		$newMetadata1 += $("" | Out-String)

		$newMetadata1 += $("" | Out-String)

		$newMetadata2 = ""

		$newMetadata2 += $metadata

		$newMetadata2 = $newMetadata2 -replace '\-\-\-(.*?)\-\-\-', ''

		$newMetadata2 = $newMetadata2 -replace '\{(.*?)\}', ''

		$newMetadata2 = $newMetadata2 -replace '!\[\]\(\.\\images\\daferncover\.png\)', '![](/images/daferncover.png)'

		$newMetadata = $newMetadata1

		$newMetadata += $newMetadata2

		Set-Content .\build\metadata.md $newMetadata
	}

	for ($i = 0; $i -lt $files.Count; $i++) {
		$input = Get-Content $files[$i].FullName -Raw
		$output = quots2Chevrons $input
		$output = $output -replace "\# ([\w, ]+)*", '# $1 {-}'
		$output += $("" | Out-String)
    
		Set-Content .\build\$($files[$i].Name) $output

		$listOfFiles += ".\build\"
		$listOfFiles += $files[$i].Name
		$listOfFiles += " "
	}
	
	$params += '--from=markdown+emoji --to=markdown --atx-headers --wrap=none --preserve-tabs'

	$command = 'pandoc'
	$command += ' '
	$command += $params
	$command += ' '
	$command += $listOfFiles # already has space after it
	$command += '-o build\dafern.md'

	Invoke-Expression $command

	if ($type -eq "first") {
	}
	else {
		$document = Get-Content .\build\dafern.md -Raw
		$document = ($document) -replace '\#(?! Dafern)', '##'
		$document = ($document) -replace ' \{(.*?)\}', ''
		$document = ($document) -replace '(?!^)\[\^(.*?)\]', '<sup id="a$1">[$1](#f$1)</sup>'
		$document = ($document) -replace '<sup(.*?)\[(.*?)\](.*?)sup>: (.*?)\n', '<b id="f$2">[$2](#a$2)</b>: $4'
		$document = ($document) -replace '<b id="f1">\[1\]\(\#a1\)</b>', "---`n<b id='f1'>[1](#a1)</b>"

		Set-Content .\build\dafern.md $document

		if (!$debug) {
			Remove-Item .\build\metadata.md
		}
        
	}
	if (!$debug) {
		Remove-Item .\build\chapter*.md
	}
}

function buildFromMd($format) {
	$params += '.\build\dafern.md --from=markdown+emoji --atx-headers --normalize --preserve-tabs --reference-location=block'

	if ($format -eq "pdf") {
		$params += ' --template=".\templates\default.tex" -o build\dafern.pdf'
	}
	elseif ($format -eq "html") {
		$params += ' --standalone --to=html5 -o build\dafern.html'
	}

	$command = 'pandoc '
	$command += $params
	Invoke-Expression $command
}

buildMd "first"
if (!$nopdf) {
	buildFromMd "pdf"
}

if (!$nohtml) {
	buildFromMd "html"
}
buildMd