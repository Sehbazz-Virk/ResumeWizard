# Build single file verion of Wizard and move to location expected by Github Pages
tiddlywiki SMAwizard --build index
Remove-Item -Path .\docs\index.html
Move-Item -Path .\SMAwizard\output\index.html -Destination .\docs\index.html

# Get commit message
$commitMessage = Read-Host -Prompt "Commit Message"

# commit and push changes
git add --all
git commit -m $commitMessage
git push