# Build single file verion of Wizard and move to location expected by Github Pages
tiddlywiki SMAwizard --build index
Remove-Item -Path .\docs\index.html
Move-Item -Path .\SMAwizard\output\index.html -Destination .\docs\index.html

#Get date and time for git commit message
$DateTime = (Get-Date).DateTime
$commitMessage = "Updating site with new changes on " + $DateTime

git add --all
git commit -m $commitMessage
git push