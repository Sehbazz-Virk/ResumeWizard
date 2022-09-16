#Move old index file to backups
$backupDate = Get-Date -Format "dd/MM/yyyy_HHmm"
$Destination = ".\backup\index_" + $backupDate + ".html"
Move-Item -Path .\docs\index.html -Destination $Destination

# Build single html file verion of Wizard and move to location expected by Github Pages
tiddlywiki SMAwizard --build index
Copy-Item -Path .\SMAwizard\output\index.html -Destination .\docs\index.html

# commit and push changes
$commitMessage = Read-Host -Prompt "Commit Message"
git add --all
git commit -m $commitMessage
git push