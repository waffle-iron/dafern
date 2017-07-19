[![Stories in Ready](https://badge.waffle.io/nnmrts/dafern.png?label=ready&title=Ready)](https://waffle.io/nnmrts/dafern?utm_source=badge)
# Dafern

## Beschreibung

"Dafern" ist ein *unvollständiges* Buch, geschrieben in deutscher Sprache.

Gelesen werden kann es jederzeit als [PDF](https://github.com/nnmrts/dafern/raw/master/build/dafern.pdf), als [Markdown-Dokument](https://github.com/nnmrts/dafern/blob/master/build/dafern.md) und als [HTML-Seite](https://github.com/nnmrts/dafern/blob/master/build/dafern.html).

## Autorinnen und Autoren

* Nano Miratus

## Build

### Ablauf

Der "Quellcode" des Buches, der sich im "src"-Verzeichnis befindet, soll nach jeder größeren, textlichen Änderung von seinem Ursprungsformat, also einer Metadaten-Datei und den einzelnen Kapitel-Dateien (geschrieben in Markdown), durch das PowerShell-Script "build.ps1" automatisch in die Endformate Markdown, PDF und HTML konvertiert werden. Die dadurch entstanden Dateien befinden sich im "build"-Verzeichnis und dienen einzig und allein dem Konsum und nicht der Bearbeitung.

Erst nachdem diese Konvertierung stattfand, sollen die Änderungen zur Repository hinzugefügt werden.

### Vorraussetzungen

Um das Buch selbst zu builden und zur Repository direkt beizutragen, werden einige Programme benötigt.

#### Alle Plattformen

* [git](https://git-scm.com/downloads)
* [pandoc](http://pandoc.org/installing.html)
* [PowerShell](https://github.com/PowerShell/PowerShell)
* [Visual Studio Code](https://code.visualstudio.com/download) (empfohlen)

#### Windows

* [MiKTeX](https://miktex.org/download)

#### Mac OS X

* [BasicTeX](http://www.tug.org/mactex/morepackages.html)

#### Linux

* [TeX Live](http://www.tug.org/texlive/quickinstall.html)

### Anleitung

#### Beim ersten Mal

1. diese Repository [forken](https://help.github.com/articles/fork-a-repo/#fork-an-example-repository), [einen lokalen Klon erstellen](https://help.github.com/articles/fork-a-repo/#step-2-create-a-local-clone-of-your-fork) und beliebige Änderungen vornehmen
2. PowerShell öffnen
3. `cd {Verzeichnis des Repository-Klons der Fork}`
4. `.\build` (nimmt vor allem beim ersten Mal einige Zeit in Anspruch)
5. `git add *`
6. `commit -m "{Kommentar zu den Änderungen}"` (den Kommentar bitte mit "build | " beginnen)
7. `git push`
8. deine erstellte Fork auf Github öffnen und [eine neue Pull-Request erstellen](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)

#### Jedes weitere Mal

1. beliebige Änderungen in der Fork vornehmen
2. PowerShell öffnen
3. `cd {Verzeichnis des Repository-Klons der Fork}`
4. `git pull https://github.com/nnmrts/dafern.git`
5. `.\build` (nimmt vor allem beim ersten Mal einige Zeit in Anspruch)
6. `git add *`
7. `commit -m "{Kommentar zu den Änderungen}"` (den Kommentar bitte mit "build | " beginnen)
8. `git push`
9. deine erstellte Fork auf Github öffnen und [eine neue Pull-Request erstellen](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)

#### Richtlinien

Kommentare sollten immer komplett klein geschrieben werden, außer es geht um Dateien oder Wörter im Text, die großgeschrieben werden.

Wichtig ist, dass wirklich vor jeder Pull-Request `.\build` ausgeführt wird. Falls das aus irgendeinem Grund nicht geht, bitte den Kommentar des Commits nicht mit "build | " beginnen.

Wenn gar keine textlichen Änderungen vorgenommen wurden, bitte nicht builden, aber den Kommentar des Commits mit "meta | " beginnen.

Wenn gar keine textlichen Änderungen vorgenommen wurden, jene Änderungen aber den Build-Prozess beeinflussen würden, bitte builden, aber den Kommentar des Commits mit "build | meta | " (in dieser Reihenfolge) beginnen.

Wenn **nicht nur** textliche Änderungen vorgenommen wurden, den Kommentar des Commits bitte mit "build | meta | " (in dieser Reihenfolge) beginnen.

## Mitwirken

Im Prinzip kann jede und jeder an dem Buch mitschreiben. Mitwirkende Autorinnen und Autoren erscheinen automatisch in der Danksagung im Buch und im AutorInnenverzeichnis. Jede Änderung wird jedoch nicht einfach übernommen, sondern geprüft und oder besprochen. Es ist allerdings eine Unterscheidung zwischen Beitragenden zu machen.

### Ohne GitHub-Account

Solche, die keinen (kostenlosen und wirklich einfach zu machenden) GitHub-Account besitzen, aber dennoch mitwirken wollen, werden dies durch E-Mail-Verkehr mit nanomiratus@gmail.com machen müssen. Eine E-Mail mit dem Betreff "Dafern" genügt. Diese Änderungen werden zwar von meinem Account aus in die Repository eingepflegt, der Name der Autorin bzw. des Autors, sofern sie bzw. er ihn preisgeben will, wird trotzdem in der Danksagung und dem AutorInnenverzeichnisses des Buches erscheinen.

### Ohne Build

Wer die Systemvorraussetzungen für den Build-Prozess nicht besitzt, kann dennoch mitwirken, indem die- bzw. derjenige einfach nur den Quellcode auf Github editiert. Diese Änderungen werden nicht automatisch in der Repository erscheinen, sondern funktionieren wie eine eigene Version des Originals. Um jene Änderung dann vorzuschlagen, ist eine Pull-Request nötig, die dann angenommen oder abgelehnt wird. Danach muss der geänderte Quellcode aber noch in die Endformate konvertiert werden, was spätestens beim nächsten Build ohnehin gemacht wird. Solche Änderungen sind also eventuell nicht sofort im fertigen Produkt enthalten.

### Ohne Build und ohne Markdownkenntnisse

Nicht jede bzw. jeder hat das Know-How, um den Quellcode erfolgreich zu editieren. Dafür ist der "Issues"-Bereich da, wo man auch textliche Änderungen vorschlagen kann.

### Mit Build

Wessen Arbeitsplatz die Vorraussetzungen erfüllt, die für den Buildprozess nötig sind, folgt bitte der Anleitung im Bereich "Build". Der sonstige Ablauf gleicht dem der Beitragenden, die das Buch nicht selbst builden können.